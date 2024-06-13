#!/usr/bin/env python3

"""
Takes a JSON file and spits out a CSV file with the same name.
If the JSON file is an object attempt to walk keys to find the first list.
This is common for outputs from AWS. If it can't it'll just crash.
"""

from pathlib import Path
import sys
import json
from csv import DictWriter

if len(sys.argv) != 2:
    print('Usage: python to_csv.py <file.json>')
    sys.exit(1)

FILE = Path.cwd() / sys.argv[1]

with open(FILE, 'r') as f:
    data = json.load(f)

pointer = data

while True:
    if isinstance(pointer, list):
        mylist = pointer
        break
    pointer = pointer[list(pointer.keys())[0]]

all_headers = {k for i in mylist for k in i.keys()}

with open(FILE.with_suffix('.csv'), 'w') as f:
    writer = DictWriter(f, fieldnames=all_headers)
    writer.writeheader()
    writer.writerows(mylist)
