function bupgrade --description "Upgrade all packages found by regex argument in ./package.json using bun" --argument-names pattern
    if ! command -vq bun; echo "Bun is not installed"; return; end
    if ! command -vq jq; echo "jq command not found"; return; end
    if [ ! -f ./package.json ]; echo "No ./package.json found"; return; end

    set -l packages_list (cat package.json | jq -r --arg term "$pattern" '(.dependencies + .devDependencies) | keys | map(select(test($term))) | join(" ")')
    if [ -z "$packages_list" ]; echo "No packages found to upgrade"; return; end

    echo '> bun update --latest '$packages_list
    echo $packages_list | xargs bun update --latest
end
