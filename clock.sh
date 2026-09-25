#!/usr/bin/env python3
# Waybar custom/clock: 12-hour clock without a leading zero (waybar's built-in
# clock uses std::chrono, which has no %-I), with a month calendar tooltip.
import calendar, html, json, time

now = time.localtime()
text = time.strftime("%a %d %b  %-I:%M %p", now)
cal = calendar.TextCalendar(calendar.MONDAY).formatmonth(now.tm_year, now.tm_mon)
print(json.dumps({"text": text, "tooltip": f"<tt>{html.escape(cal.rstrip())}</tt>"}))
