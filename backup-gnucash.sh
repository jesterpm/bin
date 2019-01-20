#!/bin/sh

BACKUP=$HOME/documents/finances/gnucash-backup
MASTER=$HOME/gnucash-master
TEST_FILE=$MASTER/2016.gnucash


if [ ! -e $BACKUP/last-updated -o $BACKUP/last-updated -ot $TEST_FILE ]; then
    NOW=$(date -I)
    tar -cj -C $(dirname $MASTER) $(basename $MASTER) | gpg -e -r 6EC484CE8FDAD4AC -o $BACKUP/finances-$NOW.tar.bz2.gpg
    touch $BACKUP/last-updated
fi
