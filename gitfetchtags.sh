#!/usr/bin/env bash
#
# update git tags
#
# XXX - find example
# find $(find .git/modules/ -type d -name tags) -type f -exec ls -latr {} + | grep -vE -- '-RC|(-|_)rc|sig-libcap|beta$'
#
# XXX - need?
# set -euo pipefail
#

# XXX - keep `got` happy and workaround ssh old rsa/new ed25519 failures
: ${GIT_SSH_COMMAND:='dbclient -yy'}
export GIT_SSH_COMMAND

( time ( grep path.*= .gitmodules | grep -v '#.*path.*=' | cut -f2 -d= | sort | while read -r i ; do { echo $i ; git -C $i pull ; git -C $i fetch -p ; git -C $i fetch --tags ; } ; echo $? ; done ) ) |& tee /tmp/gitfetchtags.out
