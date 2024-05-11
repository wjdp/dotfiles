#!/usr/bin/env python3

from pathlib import Path
import sys
from collections import defaultdict

CWD = Path.cwd()

def commonprefix(ls):
    prefixes = defaultdict(int)
    for s in ls:
        for i, c in enumerate(s):
            prefixes[s[:i]] += 1
    del prefixes[""]
    # find the length with the most occurrences
    highest_frequency = max([k for k in prefixes.values()])
    common_prefixes = [k for k, v in prefixes.items() if v == highest_frequency]
    longest_prefix = max(common_prefixes, key=len)
    return longest_prefix
    


# Collect a list of all files in the current directory
filenames = [file.name for file in CWD.iterdir() if file.is_file()]

# Find common prefix
prefix = commonprefix(filenames)

GREEN = "\033[92m"
ORANGE = "\033[93m"
ENDC = "\033[0m"    

print(f"Common prefix: {GREEN}{prefix}{ENDC}")

# ask user to confirm
if not input("Do you want to remove this prefix from all files? (y/n): ").lower().startswith("y"):
    sys.exit(0)

# Rename files
for file in CWD.iterdir():
    if file.is_file():
        if not file.name.startswith(prefix):
            print(f"{file.name} {ORANGE}skipped{ENDC}")
            continue
        new_name = file.name[len(prefix):]
        file.rename(CWD / new_name)
        print(f"{file.name} -> {GREEN}{new_name}{ENDC}")
