#!/usr/bin/python

import sys
from datetime import datetime, timedelta

SLEEP_HOURS = 8
AWAKE_HOURS = 16
NORMAL_WAKE = 8


def calc_time(wakeup_hour):
    now = datetime.now()
    if now.hour > wakeup_hour:
        wakeup_dt = datetime(
            minute=0, hour=wakeup_hour,
            day=now.day, month=now.month, year=now.year
        )
    else:
        wakeup_dt = datetime(
            minute=0, hour=wakeup_hour,
            day=now.day-1, month=now.month, year=now.year
        )

    awake_delta = now - wakeup_dt
    awake_hours = float(awake_delta.seconds) / 3600
    sleep_dt = wakeup_dt + timedelta(hours=AWAKE_HOURS)
    sleep_delta = sleep_dt - now
    sleep_delta_hours = float(sleep_delta.seconds) / 3600
    
    print("Woke up at: {}".format(wakeup_dt))
    print("Been awake for {:.2f}/{} hours".format(awake_hours, AWAKE_HOURS))
    print("Should be {:.2f}% of the day".format( (awake_hours/AWAKE_HOURS) *100))
    print("It's {:.2f} for you".format(NORMAL_WAKE + awake_hours))
    print("You sleep at {}, {:.2f} hours away".format(sleep_dt, sleep_delta_hours))

if __name__ == "__main__":
    calc_time(int(sys.argv[1]))
