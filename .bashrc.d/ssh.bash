# Sierra stopped adding SSH keys from the keychain automatically
if ! ssh-add -l >/dev/null; then
    ssh-add -A
fi
