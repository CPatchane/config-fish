
if [ -d '/usr/local/opt/mysql@5.7/bin' ]
    contains '/usr/local/opt/mysql@5.7/bin' $PATH
    or set -x PATH '/usr/local/opt/mysql@5.7/bin' $PATH
end
