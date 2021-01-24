#! /usr/bin/env bash
recent_mails=$(notmuch search --format json --output summary --limit 20 to:"jeewangue@gmail.com" tag:inbox tag:unread | jq -r '.[] | "\(.timestamp | strflocaltime("%F %H:%M:%S")) \(.authors) \(.subject)"')

echo -e $recent_mails
