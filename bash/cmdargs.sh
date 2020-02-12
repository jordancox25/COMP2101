#!/bin/bash
# This script demonstrates how the shift command works

# create an empty array to put the command line arguments into
myargs=()
# loop through the command line arguments
debug="off"
verbose="off"
while [ $# -gt 0 ];do
  # tell the user how many things are left on the command line
  echo "There are $# things left to process on the command line."
  # add whatever is in $1 to the myargs array
  myargs+=("$1")

  # tell the user what we did
  echo "Added \'$1\' to the arguments array"

# TASK 1: instead of just adding arguments to an array, use a case statement to recognize some options
# Options to recognize: -h for help, -v for verbose mode, -d N for debug mode with N being a single digit number
# If the help option is recognized, print out help for the command and exit
  case "$1" in
    -h|--help )
      helpcheck=$(basename $0)
      echo "Usage: $helpcheck [-h|--help] [-v] [-d N]"
      exit 1
      ;;
# If the verbose option is recognized, set a variable to indicate verbose mode is on
    -v|--verbose )
      verbose="on"
      ;;
# If the debug option is recognized, set a variable with the debug level from the number given after the -d on the command line
    -d )
      debug="on"
       if [[ $# -gt 1 ]]; then
        echo "found debug mode $2"
        debugnum="$2"
      else
        echo "ERROR: debug not followed by a vaild mode number; No nummber given; shutting down program."
        exit 2
      fi
      if [[ $debugnum -gt '9' ]]; then
        echo "ERROR: debug not followed by a vaild mode number; Number greater than 9; shutting down program."
        exit 3
      fi
       ;;
     esac
# display an error if the user gave the -d option without a single digit number after it.)

# Anything that wasn't recognized on the command line should still go into the myargs array

  # each time through the loop, shift the arguments left
  # this decrements the argument count for us
  shift
  # tell the user we shifted things
  echo "Shifted command line, leaving $# things left to process."
  echo "--------------------------"
  # go back to the top of the loop to see if anything is left to work on
  debugresult=$(if [[ "$debug" == "off" ]]; then
    echo "Debug mode is $debug."
  else
    echo "Debug mode is $debug and set to $debugnum."
  fi)
done
##################
#    RESULTS
##################

cat << EOF
$debugresult
Verbose mode is $verbose
Done
EOF
echo "This was what was checked over:"
echo "${myargs[@]}"

# TASK2: display the settings and myargs contents
#         Tell the user if vebose mode is on
#         Tell the user if debug mode is on and if it is, what number it is set to
#         Print out the myargs array with a label
