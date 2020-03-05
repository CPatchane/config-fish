function n2b --description "Push npm build files (defined in package.json files property) to an orphan branch" --argument-names branch_name folder
    if ! command -vq git; echo "Git is not installed"; return; end
    if ! command -vq npm; echo "npm is not installed"; return; end
    if ! command -vq tar; echo "tar is not installed"; return; end
    if [ -z "$branch_name" ]; echo "Branch name required as first argument"; return; end

    test -n "$folder"; or set -l folder "./"

    if git show-ref "refs/heads/$branch_name" --quiet;
        printf "\n%s\n" "$branch_name branch already exists :/"
        return
    end

    printf "\n%s" "> Creating the build branch..."

    git checkout --orphan "$branch_name" --quiet
    git reset .

    printf "\r%s\n" "> Creating the build branch... ✅"

    printf "\n%s" "> Packaging..."

    # pack the npm package as it would be to publish on the registry
    set -l tarball (npm pack "$folder" --quiet)

    # Just keep the tarball and the .git folder
    ls -A . | grep -v "$tarball" | grep -v ".git/" | xargs rm -rf

    # extract tarball content and strip the package/ root folder
    tar --directory ./ -xzf "$tarball" --strip-components=1
    rm -f "$tarball"

    printf "\r%s\n" "> Packaging... ✅"

    printf "\n%s" "> Committing..."

    git add .
    git commit -m "Deploy build" --quiet

    printf "\r%s\n\n" "> Committing... ✅"

    read -l -P "Git remote to push to? (origin)" remoteToPush
    test -n "$remoteToPush"; or set -l remoteToPush "origin"

    printf "\n"

    git push $remoteToPush HEAD

    printf "\n\n%s\n" "Install it using: yarn add <package>@<user>/<repo>#$branch_name"
    printf "\n%s\n" "PS: You're in a detached branch."
    printf "%s\n" "If you go back to the main branch, don't forget to install your dependencies back."
end
