#!/bin/sh

[ -z $QNOTE_FILE ] && echo "Please set QNOTE_FILE environment variable" && \
  exit 1

file=$QNOTE_FILE

[ $# = 0 ] && echo "Nothing to do." && exit 1

new()
{
  [ $# = 0 ] && echo "Nothing to note." && exit 1
  echo "$(date '+%F %H:%M:%S') $@" | tee -a $file
}

display()
{
  cat -n $file
}

remove()
{
  [ -z $1 ] && echo "Nothing to remove." && exit 1
  sed -i .bak -e "${1}d" $file
  display
}

search()
{
  [ -z $1 ] && echo "Nothing to search." && exit 1
  cat -n $file | grep $2 --color=auto $1 || \
    echo "No match."
}

case "$1" in
  "-n") shift; new $@;;
  "-d") display;;
  "-r") remove $2;;
  "-s") search $2;;
  "-si") search $2 -i;;
esac
