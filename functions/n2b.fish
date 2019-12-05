function n2b --description "Push npm build files (defined in package.json files property) to an orphan branch" --argument-names branch_name folder
    if ! type -q git; echo "Git is not installed"; return; end
    if ! type -q npm; echo "npm is not installed"; return; end
    if ! type -q tar; echo "tar is not installed"; return; end
    if [ -z "$branch_name" ]; echo "Branch name required as first argument"; return; end

    test -n "$folder"; or set -l folder "./"

    if git show-ref "refs/heads/$branch_name";
        echo "$branch_name branch already exists :/"
        return
    end

    git checkout --orphan "$branch_name"
    git reset .

    echo ""

    # pack the npm package as it would be to publish on the registry
    set -l tarball (npm pack "$folder" --quiet)

    # Just keep the tarball and the .git folder
    ls -A . | grep -v "$tarball" | grep -v ".git/" | xargs rm -rf

    # extract tarball content and strip the package/ root folder
    tar --directory ./ -xzf "$tarball" --strip-components=1
    rm -f "$tarball"

    git add .
    git commit -m "Deploy build" --quiet

    echo ""
    echo "⚠️ You're in a detached branch."
    echo "If you go back to the main branch, don't forget to install your dependencies back."
end
