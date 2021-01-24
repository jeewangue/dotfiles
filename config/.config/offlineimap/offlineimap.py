#! /usr/bin/env python3
from subprocess import check_output

def get_pass(name):
    return check_output(
        "gpg -dq {}".format(name), shell=True,
    ).strip()
