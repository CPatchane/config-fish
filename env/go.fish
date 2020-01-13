# Go (if go exists)
if command -vq go
    set -x GOPATH $HOME/Dev/go
    set -x GOROOT /usr/local/opt/go/libexec
    set -x PATH $GOPATH $PATH
    set -x PATH $GOPATH/bin $PATH
end
