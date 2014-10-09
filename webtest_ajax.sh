#!/bin/bash
if [ ! -f output.csv ]; then
    rm "output_ajax_$2_chunks.csv"
fi

phantomas "http://192.168.1.1/ajax_$2.html"  --modules=httpTrafficCompleted -R csv > tmp.csv
echo "Finished 1..."

for i in $(seq 2 $1)
do
  phantomas "http://192.168.1.1/ajax_$2.html"  --modules=httpTrafficCompleted -R csv:no-header >> tmp.csv
  echo "Finished $i..."
done

cat tmp.csv | awk -F ',' '{ print $8}' > "output_ajax_$2_chunks.csv"
rm tmp.csv
