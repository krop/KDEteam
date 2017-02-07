#!/bin/sh
if [[ $# -eq 1 ]]; then
    echo "-------------------------------------------------------------------"
    LANG=C date | tr -d '\n'
    echo -e " - fabian@ritter-vogt.de\n"
    echo "- Update to $1"
    echo ""
    exit 0
fi

if [[ $# -ne 4 ]]; then
    echo "Usage is different"
    exit 1
fi

commit_from=$1
commit_to=$2
version_from=$3
version_to=$4

echo "-------------------------------------------------------------------"
LANG=C date | tr -d '\n'
echo -e " - fabian@ritter-vogt.de\n"
echo "- Update to $version_to"
echo "  * New feature release"
echo "  * For more details please see:"
echo "  * https://www.kde.org/announcements/plasma-$4.php"
echo "- Changes since $version_from:"
changes=$(git log --pretty=oneline $commit_from...$commit_to | cut -d' ' -f2- | sed "s/^/  * /" | grep -v "Merge branch '" | grep -v "_SILENT")
if [ -z "$changes" ]; then
    changes="  * None"
fi
echo "$changes"
echo ""
