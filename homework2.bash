#!/bin/bash
function comchar(){
	case "$1" in 
		java|cpp|c)
			echo '//'
			;;
		listp|elisp)
			echo ';'
			;;
		*)
			echo '#'
			;;
	esac
}

COMMENT_CHARACTER=$(comchar $2)

############################################################
#
# Write a script to compute the source lines of code of a given file
#
############################################################

#Prints out Total number of lines
total=$(wc -l $1 | cut -d ' ' -f 1)
echo 'Total Lines  : ' $total

# supposed to print comment character based on input file but alwasy 
goes
# to '#' and i dont know bash functions well enough to fix what happened
#echo "Comment Character" $COMMENT_CHARACTER

#Prints out number of commments in file
com1=$(grep '/' $1 | cut -d '*' -f 1 | grep -c -v '^[[:space:]]*$')
com2=$(grep '*' $1 | cut -d '/' -f 1 | grep -c -v '^[[:space:]]*$')
com3=$(grep '#' $1 | cut -d '/' -f 1 | grep -c -v '^[[:space:]]*$')

com=$((  $com1 + $com2 + $com3 ))
echo 'Comments  : ' $com


#prints out only blank lines
blank=$(grep -c '^[[:space:]]*$' $1)
echo 'Blank Lines  : ' $blank


#prints out only braces 
braces1=$(grep -c '}' $1)
braces2=$(grep -c '{' $1 )
braces=$(( $braces1 + $braces2 ))
echo 'Only Braces  : ' $braces


#Prints lines of actual code
actual=$(grep -v '#' $1 | grep -v '*' | grep -v '/' | grep -v '^/s*$' | 
grep -v '}' | grep -v '|' | grep -v -c '-')
echo 'Actual Code  : ' $actual

