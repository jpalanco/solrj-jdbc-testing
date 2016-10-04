#!/usr/bin/env bash

rm -f *.bad

for x in java jisql jython python r-base spark spark2 sqlline;
do
  echo "Running $x";
  touch ${x}.bad;
  docker-compose run --rm $x && rm -f ${x}.bad;
done

# Output a message with which ones failed
ls *.bad >/dev/null && echo "The following failed: $(ls *.bad | sed -e 's/.bad//g' | tr '\n' ',' | sed -e 's/,$//g')"

# Set the exit code to the number that failed
exit $(ls *.bad | wc -l)

