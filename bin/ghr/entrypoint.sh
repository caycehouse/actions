#!/bin/sh
set -ex

gh_user=`echo $GITHUB_REPOSITORY | sed -e 's/\/.*//g'`
gh_repo=`echo $GITHUB_REPOSITORY | sed -e 's/.*\///g'`

version=`git describe --tags`
release="$RELEASE_PATH/$APPLICATION"
archive="$APPLICATION-`echo $version | cut -d "v" -f 2`.tar.gz"

tar -zcvf $archive -C $RELEASE_PATH .

ghr -v
sh -c "ghr -t $GITHUB_TOKEN -u $gh_user -r $gh_repo -n $version $version $archive"
