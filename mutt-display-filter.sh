#!/bin/sh

MESSAGE=$(cat)

NEWALIAS=$(echo "${MESSAGE}" | grep ^"From: " | sed s/[\,\"\']//g | awk '{$1=""; if (NF == 3) {print "alias" $0;} else if (NF == 2) {print "alias" $0 $0;} else if (NF > 3) {print "alias", tolower($2)"-"tolower($(NF-1)) $0;}}')

if grep -Fxq "$NEWALIAS" $HOME/.mutt/aliases; then
    :
else
    echo "$NEWALIAS" >> $HOME/.mutt/aliases
fi

# Rewrite date to local time
echo "${MESSAGE}" | sed -r "s/^Date:\\s*(([F-Wa-u]{3},\\s*)?[[:digit:]]{1,2}\\s+[A-Sa-y]{3}\\s+[[:digit:]]{4}\\s+[[:digit:]]{1,2}:[[:digit:]]{1,2}(:[[:digit:]]{1,2})?\\s+[+-][[:digit:]]{4})/date +'Date: %a, %d %b %Y %H:%M:%S %z' -d '\\1'/e"

