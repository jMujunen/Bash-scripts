#!/bin/zsh
uv pip list --outdated | awk '{print $1}' | grep -oP "^[a-z0-9_]+(-?[a-z0-9]+)?" | xargs -d\\n uv pip install -U

function uvx_upgrade_all() {
    uv tool upgrade --all
}
function pipx_upgrade_all(){
    pipx upgrade-all
}
