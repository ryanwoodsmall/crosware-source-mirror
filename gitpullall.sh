#!/usr/bin/env bash
#
# update git submodules
#
set -euo pipefail
git submodule foreach --recursive 'git pull'
echo $?
git status
