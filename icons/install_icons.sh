#!/bin/bash
for fname in *.png
do
    suff=`echo $fname | cut -d- -f3 |cut -d. -f1`;
    sudo cp $fname /usr/share/icons/hicolor/$suff/apps/compizfusion.png;
done
