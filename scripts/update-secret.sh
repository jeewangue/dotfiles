#! /bin/bash

SCRIPTDIR=$(dirname ${BASH_SOURCE:-$0})
ROOTDIR=$(realpath "${SCRIPTDIR}/..")

pushd ${ROOTDIR}

tar cz taskbook/ | gpg -esar jeewangue@gmail.com -o "${ROOTDIR}/taskbook.tar.gz.asc"
tar cz openvpn-root/ | gpg -esar jeewangue@gmail.com -o "${ROOTDIR}/openvpn-root.tar.gz.asc"

popd
