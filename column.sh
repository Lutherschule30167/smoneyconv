#
# Script for conversion of StarMoney CSV-output to human readable text files
# and to publish them on Iserv-WebDAV share
#
# Lutherschule Hanover, lower saxony, Germany
#
# Version 0.01 - use at your own risk!
##################################################################################
#  ToDo:
#
# - push files to Iserv
# - check if files stored in directory before deleting
#
##################################################################################

#!/bin/bash

#rm *.txt

#1
# format csv input to be seperated by columns
for f in *.csv; do
    column -T 5 -t -c 120 -s';' -o '||' -- "$f" > "$f.txt"
done

#2
# batch rename
for f in *csv.txt; do
   mv -- "$f" "${f%.csv.txt}.txt"
done

#3
# regex hell :)
# see https://askubuntu.com/questions/1416427/remove-characters-from-multiple-file-names for details
# add '-n' option for dry-run
rename 's/^([^.]+)\_([^.]+)\_([^.]+)\_([^.]+)\_([^.]+)\.txt$/$1_$4.txt/' *.txt


#4
#clean up
rm *.csv

