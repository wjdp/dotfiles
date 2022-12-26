# Defined in /tmp/fish.HTFyXV/unzips.fish @ line 1
function unzips
  for f in *.zip
    unzip -o $f
  end
end
