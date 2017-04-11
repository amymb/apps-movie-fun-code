#!/bin/bash

set -ex

pushd movie-fun
  echo "Packaging jar"
  ./mvnw clean package -DskipTests
popd

jar_count=`find movie-fun/target -type f -name *.jar | wc -l`

if [ $jar_count -gt 1 ]; then
  echo "More than one jar found.  Exiting"
  exit 1
fi

find movie-fun/target -type f -name *.jar -exec cp "{}" package-output/movie-fun.jar \;

echo "Done packaging"


