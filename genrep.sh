#!/bin/bash

# At the start, grep is used to grab all lines that start with the <tr> tag. The result is then piped to sed
# sed replaces all html tags with a space and the result is piped to awk
# awk prints the output by:
# 1) printing header line of the output in the BEGIN block
# 2) Ignores the 1st line of sed's result via NR>1 since that is the header of the html table
# 3) For all subsequent lines of sed's result, add the 2nd, 3rd and 4th field together and stores in the variable named total.
# 4) Prints the type of attack (stored in the 1st field) and the total

grep '<tr>' attacks.html | sed 's/<[^>]\+>/ /g' | awk 'BEGIN {print "Attacks\t\tInstances(Q3)"}
                                                       NR>1 {total=$2+$3+$4; printf "%-10s \t%d \n", $1, total}'

exit 0
