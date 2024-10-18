#!/usr/bin/env python3

import subprocess
import sys
import os
from pathlib import Path
import re

SCRIPT_PATH = os.path.realpath(__file__)
PASSWORD_STORE_PATH = Path("~/.password-store/").expanduser()

def get_passwords() -> list[str]:
    paths = PASSWORD_STORE_PATH.glob("**/*.gpg")
    password_names = [str(path.relative_to(PASSWORD_STORE_PATH).with_suffix("")) for path in paths]
    icon = sys.argv[2] + " " if len(sys.argv) > 2 else ""
    return [f"{icon}<span>{name}</span>" for name in password_names]

def notify_send(message: str, level: str|None=None) -> None:
    command = f"notify-send -a pass 'pass' '{re.escape(message)}'" + f" -u {level}" if level else ""
    print(command)
    subprocess.call(command, shell=True)

def show_passwords(command: str, icon: str) -> None:
    try:
        wofi_result = subprocess.check_output(f"{SCRIPT_PATH} list {icon} | wofi --allow-markup --show dmenu --prompt 'Password' --lines 10", shell=True)
    except subprocess.CalledProcessError:
        # notify_send("Exited without choosing password", level="critical")
        sys.exit(1)

    chosen_item = wofi_result.decode().strip()
    requested_pw = re.search(r">(.*)</", chosen_item).group(1)
    
    try:
        subprocess.check_output(f"{command} {requested_pw}", shell=True)
    except subprocess.CalledProcessError as e:
        notify_send("Failed to copy", level="critical")
        sys.exit(1)
    notify_send(f"{requested_pw} copied to clipboard", level="normal")


if __name__ == "__main__":
    try:
        command = sys.argv[1]
    except IndexError:
        print("No command provided")
        sys.exit(1)
    
    match command:
        case "pass":
            show_passwords("pass -c", icon="🔑")
        case "otp":
            show_passwords("pass otp -c", icon="🔢")
        case "list":
            print("\n".join(get_passwords()))
        case _:
            print("Invalid command")
            sys.exit(1)

