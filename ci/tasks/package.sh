#!/bin/bash

set -ex

pushd movie-fun
  echo "Packaging war"
  ./mvnw clean package -DskipTests
popd

war_count=`find movie-fun/target -type f -name *.war | wc -l`

if [ $war_count -gt 1 ]; then
  echo "More than one war found.  Exiting"
  exit 1
fi

find movie-fun/target -type f -name *.war -exec cp "{}" package-output/movie-fun.war \;

echo "Done packaging"


