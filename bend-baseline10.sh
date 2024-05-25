nvcc --version
for i in {1..100}; do
	echo -n "CPU single thread run"
	bend run -s main.bend | grep TIME | sed -E 's/run- TIME:/,/'| sed 's/s$//'

	echo -n "CPU multi thread run"
	bend run-c -s main.bend | grep TIME | sed -E 's/run- TIME:/,/'| sed 's/s$//'

	echo -n "GPU multi thread run"
	bend run-cu -s main.bend | grep TIME | sed -E 's/run- TIME:/,/'| sed 's/s$//'
done
