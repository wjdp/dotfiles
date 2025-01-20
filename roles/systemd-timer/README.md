# systemd-timer role

Basic role to manage systemd timers. Better than using cron.

```yaml
- name: Schedule a task
  include_role:
    name: systemd-timer
    vars:
      unit_name: "unique"
      service_description: "Run a scheduled job"
      service_exec_start: "command"
      timer_on_calendar: "*-*-* *:10:00"
```
