function extract
    set -l archive $argv[1]
    set -l name (basename $archive .zip)
    set -l tmpdir (mktemp -d -p .)

    # Extract to temp dir first to inspect structure
    7z x $archive -o"$tmpdir" -y

    if test $status -ne 0
        rm -rf $tmpdir
        echo "Extraction failed: $archive"
        return 1
    end

    set -l contents $tmpdir/*
    if test (count $contents) -eq 1 -a -d $contents[1]
        # Single root folder — move it directly
        mv $contents[1] ./(basename $contents[1])
    else
        # Multiple items — wrap in a folder named after the zip
        mkdir -p $name
        mv $tmpdir/* $name/
    end

    rm -rf $tmpdir
    mv $archive "$archive.extracted"
end
