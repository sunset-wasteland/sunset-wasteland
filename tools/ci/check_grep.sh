#!/bin/bash
set -euo pipefail

#nb: must be bash to support shopt globstar
shopt -s globstar

st=0

if git grep -Pn "\r\n"; then
	echo "ERROR: CRLF line endings detected. Please stop using the webeditor, and fix it using a desktop Git client."
	st = 1
fi;
if grep -El '^\".+\" = \(.+\)' _maps/**/*.dmm;	then
    echo "ERROR: Non-TGM formatted map detected. Please convert it using Map Merger!"
    st=1
fi;
if grep -Pn '^\ttag = \"icon' _maps/**/*.dmm;	then
    echo "ERROR: tag vars from icon state generation detected in maps, please remove them."
    st=1
fi;
if grep -Pn 'step_[xy]' _maps/**/*.dmm;	then
    echo "ERROR: step_x/step_y variables detected in maps, please remove them."
    st=1
fi;
if grep -Pn 'pixel_[^xy]' _maps/**/*.dmm;	then
    echo "ERROR: incorrect pixel offset variables detected in maps, please remove them."
    st=1
fi;
#Removed; TODO: Re-enable cable varedit check if smartcables are ported
#echo "Checking for cable varedits"
#if git grep -Pn '/obj/structure/cable(/\w+)+\{' _maps/**/*.dmm;	then
#    echo "ERROR: vareditted cables detected, please remove them."
#    st=1
#fi;
if grep -Pn '\td[1-2] =' _maps/**/*.dmm;	then
    echo "ERROR: d1/d2 cable variables detected in maps, please remove them."
    st=1
fi;
echo "Checking for stacked cables"
if grep -Pn '"\w+" = \(\n([^)]+\n)*/obj/structure/cable,\n([^)]+\n)*/obj/structure/cable,\n([^)]+\n)*/area/.+\)' _maps/**/*.dmm;	then
    echo "found multiple cables on the same tile, please remove them."
    st=1
fi;
echo "Checking for varedited /area paths"
if grep -Pn '^/area/.+[\{]' _maps/**/*.dmm;	then
    echo "ERROR: Vareditted /area path use detected in maps, please replace with proper paths."
    st=1
fi;
echo "Checking for base /turf path in maps"
if grep -Pn '\W\/turf\s*[,\){]' _maps/**/*.dmm; then
    echo "ERROR: base /turf path use detected in maps, please replace with proper paths."
    st=1
fi;
if git grep -Pn '^/*var/' *.dm; then
    echo "ERROR: Unmanaged global var use detected in code, please use the helpers."
    st=1
fi;
echo "Checking for space indentation"
if git grep -Pn '(^ {2})|(^ [^ * ])|(^    +)' *.dm; then
    echo "space indentation detected"
    st=1
fi;
echo "Checking for mixed indentation"
if git grep -Pn '^\t+ [^ *]' *.dm; then
    echo "mixed <tab><space> indentation detected"
    st=1
fi;
echo "Checking for missing trailing newlines"
if grep -PzL '\n$' **/*.dm; then
    echo "missing newlines detected"
    st=1
fi;
echo "Checking for proc arguments starting with 'var'"
if git grep -Pn '^/[\w/]\S+\(.*(var/|, ?var/.*).*\)' *.dm; then
    echo "changed files contains proc argument starting with 'var'"
    st=1
fi;
echo "Checking for Vault-Tec typos in code"
if git grep -in 'vault[\s-]?tek' *.dm; then
    echo "ERROR: Misspelling(s) of Vault-Tec detected in code, please replace the K with a C."
    st=1
fi;
echo "Checking for Vault-Tec typos in maps"
if grep -in 'vault[\s-]?tek' _maps/**/*.dmm; then
    echo "ERROR: Misspelling(s) of Vault-Tec detected in maps, please replace the K with a C."
    st=1
fi;
echo "Checking for non-lowercase map json files"
if git ls-files '_maps/*[[:upper:]]*.json' | grep ''; then
    echo "Uppercase in a map json filename detected, these must be all lowercase."
    st=1
fi;
for json in _maps/*.json
do
    map_path=$(jq -r '.map_path' $json)
    while read map_file; do
        filename="_maps/$map_path/$map_file"
        if [ ! -f $filename ]
        then
            echo "found invalid file reference to $filename in _maps/$json"
            st=1
        fi
    done < <(jq -r '[.map_file] | flatten | .[]' $json)
done

exit $st
