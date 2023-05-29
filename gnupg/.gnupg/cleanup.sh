#! /usr/bin/env bash
# Clean up the GPG Keyring.  Keep it tidy.
# blog.lavall.ee

echo -n "Expired Keys: "
for expiredKey in $(gpg --list-keys | awk '/^pub.* \[expired: / {id=$2; sub(/^.*\//, "", id); print id}' | fmt -w 999 ); do
	echo -n "$expiredKey"
	gpg --batch --quiet --delete-keys $expiredKey >/dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo -n "(OK), "
	else
		echo -n "(FAIL), "
	fi
done
echo done.

echo -n "Update Keys: "
for keyid in $(gpg -k | grep "^pub" | grep -v "expired:" | grep -v "revoked:" | cut -d'/' -f2 | cut -d' ' -f1); do
	echo -n "$keyid"
	gpg --batch --quiet --edit-key "$keyid" check clean cross-certify save quit > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo -n "(OK), "
	else
		echo -n "(FAIL), "
	fi
done
echo done.

echo -n "Refresh Keys from Ubuntu Keyserver: "
gpg --batch --keyserver hkps://keyserver.ubuntu.com --refresh-keys

echo -n "Refresh Keys from OpenPGP Keyserver: "
gpg --batch --keyserver hkps://keys.openpgp.org --refresh-keys

echo -n "Refresh Keys from MIT Keyserver: "
gpg --batch --keyserver hkps://pgp.mit.edu --refresh-keys

