#!/bin/bash

echo "Number of hkl files"
find . -name "*.hkl" | grep -v -e spiketrain -e mountains | wc -l

echo "Number of mda files"
find mountains -name "firings.mda" | wc -l

echo "#==========================================================="
echo "Start Times"

for file in *.out; do
echo "==> " $file " <=="
grep -h -m1 "time.struct_time" $file | tail -n1
done 

echo "End Times"

for file in *.out; do
echo "==> " $file " <=="
grep -h -A1 "time.struct_time" $file | tail -n2
grep -h -A1 -B1 "MessageId" $file
done
