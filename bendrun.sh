nvcc --version

echo "starting CPU single thread run"
export START_NANO=`date +%s%3N`
bend run main.bend
export END_NANO=`date +%s%3N`
echo "time to run: $(($END_NANO-$START_NANO))"

echo "starting CPU multi thread run"
export START_NANO=`date +%s%3N`
bend run-c main.bend
export END_NANO=`date +%s%3N`
echo "time to run: $(($END_NANO-$START_NANO))"

echo "starting GPU multi thread run"
export START_NANO=`date +%s%3N`
bend run-cu main.bend
export END_NANO=`date +%s%3N`
echo "time to run: $(($END_NANO-$START_NANO))"
