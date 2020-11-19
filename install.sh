#!/bin/env sh

set -e

. ./conf.sh

for DEP in $DEPENDENCIES
do
     $INSTALL_PGK $DEP
done

git submodule init


