#!/bin/bash
# Copies external media onto the external hard drive directories
# organized into date folders
#
# Example Usage:
#
#   import.sh -s
#   import.sh '/Volumes/NO\ NAME/PRIVATE/AVCHD/BDMV/STREAM/'*
#   import.sh .*
#
# Author: Richard (@rchrd2)

# Path to where the Sony A7 stores it's files
SONY_PATH="/Volumes/NO NAME/PRIVATE/AVCHD/BDMV/STREAM"
DEST_PATH="/Volumes/WD My Passport"

# opt parsing code
#---------------------------------------
# getopt example from https://stackoverflow.com/a/14203146/1373318

# Reset in case getopts has been used previously in the shell
OPTIND=1
SONY=0
while getopts "h?s" opt; do
    case "$opt" in
    h|\?)
        echo "-s or ./*"
        exit 0
        ;;
    s)  SONY=1
        ;;
    esac
done
shift $((OPTIND-1))
[ "$1" = "--" ] && shift

if [ $SONY -eq 1 ]; then
  FILES=$SONY_PATH/*.MTS
else
  FILES=$@
fi

# End opt parsing code
#---------------------------------------

IFS=$(echo -en "\n\b")
for f in $FILES; do
  if [ -d $f ]; then continue; fi
  echo $f
  file_date=$(stat -f "%B" "$f")
  datedir=$(date -j -f "%s" "$file_date" +"%Y-%m-%d")
  dest="$DEST_PATH/$datedir/$(basename $f)"
  if [ -f "$dest" ]; then
    echo "File '$dest' already exists."
  else
    #echo `file $f`
    echo cp $f $dest
    mkdir -p $(dirname $dest)
    cp $f $dest
  fi
done


echo "Done."
exit 0
