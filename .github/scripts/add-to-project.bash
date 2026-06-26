#!/usr/bin/env bash

log() { echo ">>> $*" >&2; }
die() { log "$*"; exit 1; }

[[ -n "$GH_TOKEN" ]] || die "GH_TOKEN must be set"

PROJECT_OWNER="${PROJECT_OWNER:-platform-mesh}"
PROJECT_NUMBER="${PROJECT_NUMBER:-1}"

get_project_id() {
    gh api graphql -f query='
        query($org: String!, $number: Int!) {
            organization(login: $org) {
                projectV2(number: $number) {
                    id
                }
            }
        }
    ' -f org="$PROJECT_OWNER" -F number="$PROJECT_NUMBER" --jq '.data.organization.projectV2.id'
}

get_team_members() {
    {
        gh api --paginate "/orgs/platform-mesh/teams/kube/members" --jq '.[].login'
    } | sort -u
}

query_node_ids() {
    local query="$1"
    [[ -z "$query" ]] && die "no query passed"

    gh api graphql --paginate -f query='
        query($search: String!, $cursor: String) {
            search(query: $search, type: ISSUE, first: 100, after: $cursor) {
                pageInfo {
                    hasNextPage
                    endCursor
                }
                nodes {
                    ... on Issue { id }
                    ... on PullRequest { id }
                }
            }
        }
    ' -f search="$query" --jq '.data.search.nodes[].id'
}

add_node_to_project() {
    local project_id="$1"
    [[ -z "$project_id" ]] && die "No project_id passed"
    local node_id="$2"
    [[ -z "$node_id" ]] && die "No node_id passed"

    gh api graphql -f query='
        mutation($projectId: ID!, $contentId: ID!) {
            addProjectV2ItemById(input: {projectId: $projectId, contentId: $contentId}) {
                item {
                    id
                }
            }
        }
    ' -f projectId="$project_id" -f contentId="$node_id" --jq '.data.addProjectV2ItemById.item.id'
}

declare -A handled_nodes=()

add_query_result_to_project() {
    local project_id="$1"
    [[ -z "$project_id" ]] && die "No project_id passed"
    local query="$2"
    [[ -z "$query" ]] && die "no query passed"

    for node_id in $(query_node_ids "$query"); do
        if [[ -n "${handled_nodes["$node_id"]}" ]]; then
            continue
        fi
        log "Adding node '$node_id'"
        if add_node_to_project "$project_id" "$node_id" >/dev/null; then
            handled_nodes["$node_id"]=done
        fi
    done
}

build_user_filter() {
    local qualifier="$1"  # author or assignee
    local members="$2"
    echo "$members" | awk -v q="$qualifier" 'NR==1{s=q":"$0} NR>1{s=s" OR "q":"$0} END{print "("s")"}'
}

do_queries() {
    local project_id
    project_id=$(get_project_id) || die "Failed to get project ID"
    log "Project ID: $project_id"

    local members
    members=$(get_team_members) || die "Failed to get team members"
    log "Team members: $(echo "$members" | tr '\n' ' ')"

    local author_filter assignee_filter
    author_filter=$(build_user_filter "author" "$members")
    assignee_filter=$(build_user_filter "assignee" "$members")

    for org in platform-mesh kcp-dev; do
        log "Querying org: $org"

        add_query_result_to_project "$project_id" \
            "org:${org} is:pr state:open ${author_filter}"

        add_query_result_to_project "$project_id" \
            "org:${org} is:issue state:open ${assignee_filter}"
    done
}

cmd="${1:-all}"
shift || true

case "$cmd" in
    (all)    do_queries ;;
    (query)  query_node_ids "$@" ;;
    (add)    PROJECT_ID=$(get_project_id); add_query_result_to_project "$PROJECT_ID" "$@" ;;
    (*)      die "Unknown command: $cmd (available: all, query, add)" ;;
esac
