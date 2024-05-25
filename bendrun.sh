nvcc --version

echo "starting CPU single thread run"
export START_NANO=`date +%s%3N`
bend run -s main.bend
export END_NANO=`date +%s%3N`
echo "time to run: $(($END_NANO-$START_NANO))"
echo ""

echo "starting CPU multi thread run"
export START_NANO=`date +%s%3N`
bend run-c -s main.bend
export END_NANO=`date +%s%3N`
echo "time to run: $(($END_NANO-$START_NANO))"
echo ""

echo "starting GPU multi thread run"
export START_NANO=`date +%s%3N`
bend run-cu -s main.bend
export END_NANO=`date +%s%3N`
echo "time to run: $(($END_NANO-$START_NANO))"
