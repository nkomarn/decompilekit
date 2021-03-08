#!/usr/bin/env bash
if [ -z "$1" ]
  then
    echo "Specify input JAR file."
    exit 1
fi

name=${1%.jar}

echo "Extracing $name..."
mkdir $name
cd $name

mkdir extracted
cd extracted
unzip ../../$1
cd ..

echo "Decompiling extracted contents..."
mkdir decompiled
java -jar ../fernflower.jar -dgs=1 -hdc=0 -rbr=0 -asc=1 -udv=0 extracted decompiled

echo "Done!"