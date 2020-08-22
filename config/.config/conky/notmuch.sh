#! /usr/bin/env bash
recent_mails=$(notmuch search --format json --output summary --limit 10 to:"jeewangue@gmail.com" tag:inbox tag:unread | jq --join-output '.[] | "\(.date_relative) \(.authors) \(.subject)\n"')

echo -e $recent_mails
