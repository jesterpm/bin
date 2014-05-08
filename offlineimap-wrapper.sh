#!/bin/sh

export KRB5CCNAME=$(cat $HOME/.KRB5CCNAME)
klist -s && /usr/bin/offlineimap >> $HOME/.offlineimap.log
