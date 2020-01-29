#!/bin/bash
#
# this script rolls a six-sided die
#

# Task: Improve this script by making it roll as many dice as there are letters in your first name, instead of just one

# roll the dice and display the result
echo "You are rolling 5 six-sided dice, and 1 twenty-sided die."
###########################
#Rolling the 5 6-sided dice
#########################
echo "
Rolling the 5 six-sided dice results in...
$(( RANDOM % 6 + 1)), $(( RANDOM % 6 + 1)), $(( RANDOM % 6 + 1)), $(( RANDOM % 6 + 1)), $(( RANDOM % 6 + 1)) rolled "
##########################
#Rolling the 20-sided dice
##########################
echo "
Rolling the 1 twenty-sided die results in...
$(( RANDOM % 20 + 1)) rolled
"
