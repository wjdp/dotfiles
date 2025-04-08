function cursor
    nohup ~/bin/Cursor.AppImage --no-sandbox --ozone-platform=wayland $argv > /dev/null 2>&1 &
    disown
end
