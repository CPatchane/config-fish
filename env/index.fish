# (dirname (status -f)) give the current script directory
# see https://github.com/fish-shell/fish-shell/issues/1818
for f in (ls (dirname (status -f))/*.fish | grep -v "index.fish")
    source $f
end
