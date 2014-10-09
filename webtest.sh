#!/bin/bash
if [ ! -f output.csv ]; then
    rm "output_$2_chunks.csv"
fi

phantomas "http://192.168.1.2:8000/$2_chunks.html"  --modules=httpTrafficCompleted -R csv > tmp.csv
echo "Finished 1..."

for i in $(seq 2 $1)
do
  phantomas "http://192.168.1.2:8000/$2_chunks.html"  --modules=httpTrafficCompleted -R csv:no-header >> tmp.csv
  echo "Finished $i..."
done

cat tmp.csv | awk -F ',' '{ print $8}' > "output_$2_chunks.csv"
rm tmp.csv
