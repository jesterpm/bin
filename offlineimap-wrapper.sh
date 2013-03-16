#!/bin/sh

. $HOME/.gpg-agent-info
export GPG_AGENT_INFO 
export DISPLAY=:0
/usr/bin/offlineimap >> $HOME/.offlineimap.log

