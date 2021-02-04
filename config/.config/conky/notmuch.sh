#! /usr/bin/env bash
address=${1:-jeewangue@gmail.com}
count=${2:-10}

recent_mails=$(notmuch search --format json --output summary --limit $count to:"$address" tag:inbox and tag:unread | jq --join-output '.[] | "\\n${color2}Subject:${color} \(.subject | .[0:80])\\n${color2}Time:${color} \(.timestamp | strflocaltime("%F %H:%M")) ${color2}From:${color} \(.authors)\\n"')

echo -ne $recent_mails
