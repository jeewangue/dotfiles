#! /bin/bash

SCRIPTDIR=$(dirname ${BASH_SOURCE:-$0})
ROOTDIR=$(realpath "${SCRIPTDIR}/..")

pushd ${ROOTDIR}

tar cz taskbook/ | gpg -esar jeewangue@gmail.com -o "${ROOTDIR}/taskbook.tar.gz.asc"

popd
