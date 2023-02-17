#! /bin/bash

SCRIPTDIR=$(dirname ${BASH_SOURCE:-$0})
ROOTDIR=$(realpath "${SCRIPTDIR}/..")

pushd ${ROOTDIR}

gpg -dq "${ROOTDIR}/taskbook.tar.gz.asc" | tar xvzf -

popd
