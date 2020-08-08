# Go (if go exists)
if command -vq go
    if not string match -q '*go\/libexec*' $PATH
        set -x GOPATH $HOME/Dev/go
        set -x GOROOT /usr/local/opt/go/libexec
        set -x PATH $GOPATH $PATH
        set -x PATH $GOPATH/bin $PATH
    end
end
