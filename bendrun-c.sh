
export START_NANO=`date +%s%3N`
bend run-c main.bend
export END_NANO=`date +%s%3N`
echo "time to run: $(($END_NANO-$START_NANO))"
