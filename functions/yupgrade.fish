function yupgrade --description "Upgrade all packages found by regex argument in ./package.json using yarn"
    if ! type -q yarn; echo "Yarn is not installed"; return; end
    if ! type -q jq; echo "jq command not found"; return; end
    if [ ! -f ./package.json ]; echo "No ./package.json found"; return; end

    set -l packages_list (cat package.json | jq -r --arg term "$argv[1]" '(.dependencies + .devDependencies) | keys | map(select(test($term))) | join(" ")')
    if [ -z "$packages_list" ]; echo "No packages found to upgrade"; return; end

    echo '> yarn upgrade --latest '$packages_list
    echo $packages_list | xargs yarn upgrade --latest
end
