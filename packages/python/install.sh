#!/usr/bin/env bash

BASEDIR=$(dirname "$0")

if type pip > /dev/null 2>&1; then
	pip install -U -r "$BASEDIR/user.requirements.txt"
fi

