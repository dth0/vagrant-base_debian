#!/usr/bin/env bash

declare -a STATUS
STATUS="false"

CMD=$(which tuned-adm)

[ ! -z "$CMD" ] && {
    $CMD active | grep -q "virtual-guest"
    [ "$?" -ne "0" ] && STATUS="true"
}

echo "{\"status\" : ${STATUS}}"

exit 0

