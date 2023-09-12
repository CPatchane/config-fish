function p --description "Determine package manager and run command with it"
    if [ -f ./bun.lockb ];
        if ! command -vq bun; echo "Bun usage detected but not installed"; return; end
        bun $argv
    else if [ -f ./package-lock.json ];
        if ! command -vq npm; echo "NPM usage detected but not installed"; return; end
        npm "$argv"
    else if [ -f ./yarn.lock ];
        if ! command -vq yarn; echo "Yarn usage detected but not installed"; return; end
        yarn $argv
    else
        echo "No package manager usage detected."
    end
end
