GITHUB_TOKEN_FILE="${HOME}/.github.token"
if [[ -f "${GITHUB_TOKEN_FILE}" && -r "${GITHUB_TOKEN_FILE}" ]]; then
    read GITHUB_TOKEN < "${GITHUB_TOKEN_FILE}"
    export GITHUB_TOKEN
fi
