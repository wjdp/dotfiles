function aax-convert --description 'Decrypts Audible AAX file' --argument file
  if test (count $argv) -ne 1
     echo "Error: This function requires exactly one argument"
     return 1
  end
  set base (basename $argv .aax)
  if not test -e $argv
     echo $argv does not exist
  else
    ffmpeg -activation_bytes b1e14c03 -i $argv -c copy $base.m4a
    echo "Wrote $base.m4a"
  end
end
