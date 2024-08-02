#!/usr/bin/env bash
#
# update git tags
#

# XXX - need?
# set -euo pipefail

# XXX - keep `got` happy and workaround ssh old rsa/new ed25519 failures
: ${GIT_SSH_COMMAND:='dbclient -yy'}
export GIT_SSH_COMMAND

( time ( grep path.*=.*got/git .gitmodules | cut -f2 -d= | sort | while read -r i ; do { echo $i ; git -C $i pull ; git -C $i fetch -p ; git -C $i fetch --tags ; } ; echo $? ; done ) ) |& tee /tmp/gitfetchtags.out
