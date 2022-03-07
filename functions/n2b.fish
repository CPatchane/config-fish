function n2b --description "Push npm build files (defined in package.json files property) to an orphan branch" --argument-names branchName folder
    if ! command -vq git; echo "Git is not installed"; return; end
    if ! command -vq npm; echo "npm is not installed"; return; end
    if ! command -vq tar; echo "tar is not installed"; return; end
    if [ -z "$branchName" ]; echo "Branch name required as first argument"; return; end

    test -n "$folder"; or set -l folder "./"

    read -l -P "Git remote to push to? (origin) " remoteToPush
    test -n "$remoteToPush"; or set -l remoteToPush "origin"

    set -l remoteUrl (git remote get-url $remoteToPush)
    string match -rq '.*[:/](?<host>[\\w-]*)\\/(?<repo>[\\w-]*)\\.git\\/?$' $remoteUrl

    printf "\n%s\n" "> Checking repository..."

    if git show-ref "refs/heads/$branchName" --quiet;
        set -g localBranchExists 1
        printf "\n%s" "Branch `$branchName` already exists locally."
    else
        set -g localBranchExists 0
    end

    if git ls-remote -h --exit-code $remoteUrl $branchName &> /dev/null;
        set -g remoteBranchExists 1
        printf "\n%s" "Branch `$branchName` already exists on the remote."
    else
        set -g remoteBranchExists 0
    end

    if test $localBranchExists -eq 1; or test $remoteBranchExists -eq 1;
        printf "\n\n"
        read -l -P "Do you want to erase? " isOverwritten
        switch $isOverwritten
        case y yes Y YES
            if test $localBranchExists -eq 1; git branch -qD $branchName; end
            if test $remoteBranchExists -eq 1; git push -qd $remoteToPush $branchName; end
        case '*'
            printf "\n%s\n\n" "Aborted."
            return
        end
    end

    printf "\n%s\n" "> Checking repository... ✅"

    printf "\n%s" "> Creating the build branch..."

    git checkout --orphan "$branchName" --quiet
    git reset .

    printf "\r%s\n" "> Creating the build branch... ✅"

    printf "\n%s" "> Packaging..."

    # For some reasons, npm pkg get return string with double quotes, so we remove them
    set -l pkgName (npm pkg get name | string sub -s 2 -e -1)

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

    git push $remoteToPush HEAD

    if test $localBranchExists -eq 1; or test $remoteBranchExists -eq 1;
        printf "\n\n%s\n" "Re-install it using: yarn remove $pkgName; yarn add $pkgName@$host/$repo#$branchName"
    else
        printf "\n\n%s\n" "Install it using: yarn add $pkgName@$host/$repo#$branchName"
    end
    printf "\n%s\n" "PS: You're in a detached branch."
    printf "%s\n" "If you go back to the main branch, don't forget to install your dependencies back."
end
