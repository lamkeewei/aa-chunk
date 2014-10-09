#!/bin/bash

for i in $(seq 2 8)
do
  chunks=$(( i * i ))

  mkdir "$chunks-chunks"
  convert picture_large.png -crop "$i"x"$i"@  +repage  +adjoin  "$chunks-chunks/chunk_%d.png"
done