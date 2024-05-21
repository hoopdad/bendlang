
export START_NANO=`date +%s%3N`
bend run-cu main.bend
export END_NANO=`date +%s%3N`
echo "time to run: $(($END_NANO-$START_NANO))"
