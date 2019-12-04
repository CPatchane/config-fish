function n2b --description "Push npm build files (defined in ./package.json files property) to an orphan branch"
    if ! type -q git; echo "Git is not installed"; return; end
    if ! type -q jq; echo "jq command not found"; return; end
    if [ ! -f ./package.json ]; echo "No ./package.json found"; return; end

    # package.json is never added itself in the files property but must be deployed
    set -l build_files (cat package.json | jq -r '(.files + ["package.json"])[]')
    if [ -z "$build_files" ]; echo "No build files found to push"; return; end

    set -l branch_exists (git show-ref "refs/heads/$argv[1]")
    if [ -n "$branch_exists" ];
        echo "$argv[1] branch already exists :/"
        return
    end

    git checkout --orphan "$argv[1]"

    echo "To push to $argv[1] branch: $build_files"
    echo ""

    git reset .
    # We often want to push some build files ignored by the main repo
    rm -f .gitignore
    git add $build_files
    git commit -m "Deploy build"
    # clean the working directory (not build files)
    git clean -fd

    echo ""
    echo "⚠️ You're in a detached branch."
    echo "If you go back to the main branch, don't forget to install your dependencies back."
end
