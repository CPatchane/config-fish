function notify --description "Display OS X notification using arguments as message"
    if ! command -vq osascript; echo "Only available on OS X (use osascript)"; return; end

    osascript -e 'display notification "'(string join ' ' $argv)'" with title "Alert from shell" sound name "Hero"'
end
