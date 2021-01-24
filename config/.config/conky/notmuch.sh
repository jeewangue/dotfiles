#! /usr/bin/env bash
recent_mails=$(notmuch search --format json --output summary --limit 10 to:"jeewangue@gmail.com" tag:inbox tag:unread | jq --join-output '.[] | "\\n${color2}Subject:${color} \(.subject | .[0:80])\\n${color2}Time:${color} \(.timestamp | strflocaltime("%F %H:%M"))  ${color2}From:${color} \(.authors)\\n"')

echo -ne $recent_mails
