find_hq() {
    local studio_host="${1}";
    ssh atlassian-support-jump.managed.contegix.com curl -s "http://puppet01.contegix.com/node/env?${studio_host}" | awk '/hq_server:/ { print $2 }'
}

open_hq() {
    open "http://$(find_hq "${@}")"
}

