function qr --description 'Generate a QR code from text/URL and display in terminal'
  if test -n "$argv"
    echo $argv | qrencode -t ansiutf8
  else if not isatty stdin
    qrencode -t ansiutf8
  else
    echo "qr: no input provided" >&2
    return 1
  end
end
