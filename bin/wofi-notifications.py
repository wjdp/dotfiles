#!/usr/bin/env python3

import subprocess
import sys
import os
from pathlib import Path
import json
from typing import NamedTuple
import re

SCRIPT_PATH = os.path.realpath(__file__)


class Notification(NamedTuple):
    app_name: str
    app_icon: str
    category: str
    desktop_entry: str
    summary: str
    body: str
    id: int
    urgency: int
    # actions: list[str]


def truncate(string, length):
    string = string.replace("\n", " ")
    return string if len(string) <= length else string[:length] + "..."


def get_notifications():
    notifications_result = subprocess.check_output("makoctl history | cat", shell=True)
    notifications = json.loads(notifications_result)
    notifications_data = notifications["data"][0]
    return [
        Notification(
            app_name=notification["app-name"]["data"],
            app_icon=notification["app-icon"]["data"],
            category=notification["category"]["data"],
            desktop_entry=notification["desktop-entry"]["data"],
            summary=notification["summary"]["data"],
            body=truncate(notification["body"]["data"], 80),
            id=notification["id"]["data"],
            urgency=notification["urgency"]["data"],
        )
        for notification in notifications_data
    ]


def get_icon(urgency):
    match urgency:
        case 0:
            return "🔹"
        case 1:
            return "💬"
        case 2:
            return "🛑"


def show():
    try:
        wofi_result = subprocess.check_output(
            f"{SCRIPT_PATH} list | wofi -I --allow-markup --show dmenu --lines 10 --prompt Notifications",
            shell=True,
        )
    except subprocess.CalledProcessError:
        sys.exit(1)

    text = wofi_result.decode().strip()
    notification_id = re.search(r">\[(\d+)\]<", text).group(1)
    subprocess.call(f"makoctl invoke -n {notification_id}", shell=True)


def render_notification(notification: Notification):
    return (
        f"{get_icon(notification.urgency)} "
        f"<span font_weight='bold' fgalpha='30%'>{notification.app_name}</span> "
        f"{notification.summary}: "
        f"{notification.body} "
        f"<span fgalpha='10%'>[{notification.id}]</span> "
    )


if __name__ == "__main__":
    try:
        command = sys.argv[1]
    except IndexError:
        print("No command provided")
        sys.exit(1)

    match command:
        case "list":
            notifications = get_notifications()
            for notification in notifications:
                print(render_notification(notification))
        case "show":
            show()
        case _:
            print("Invalid command")
            sys.exit(1)
