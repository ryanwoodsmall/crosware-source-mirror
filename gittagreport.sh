#!/usr/bin/env bash
#
# report on git tags
#
: ${GIT_SSH_COMMAND:='dbclient -yy'}
export GIT_SSH_COMMAND

git submodule \
| awk '{print $2}' \
| while read -r i ; do
  echo "${i}"
  git -C "${i}" fetch --tags --force --verbose |& sed "s,^,${i}: ,g"
  echo
done
