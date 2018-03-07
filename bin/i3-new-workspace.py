#!/usr/bin/env python3

import i3ipc
import string
import random

i3 = i3ipc.Connection()

i3.command("workspace _{}{}".format(random.choice(string.hexdigits), random.choice(string.hexdigits)))
