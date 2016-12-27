#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

of_version=v0.9.8
of_tarball=of_${of_version}_linux64_release.tar.gz

if [ ! "$(ls of)" ]; then
  # if the of directory is empty

  if [ ! -f "$of_tarball" ]; then
    echo Openframeworks tarball not present, downloading it...
    curl -O http://openframeworks.cc/versions/${of_version}/${of_tarball};
  fi

  echo Extracting the archive into /tmp/of...
  rm -Rf /tmp/of && mkdir /tmp/of
  tar xzf $of_tarball -C /tmp/of --strip-components 1

  echo Moving if from /tmp/of to ./of...
  mv /tmp/of/* ./of/

  echo Cleaning
  rm -Rf /tmp/of
fi

echo Building the container...
docker build \
    -t ybycode/openframeworks \
    .

echo Compiling the openframworks code from within the container...
docker run --rm -it \
    --volume=$(pwd)/of:/of \
    ybycode/openframeworks \
    /of/scripts/linux/compileOF.sh -j4

echo DONE!
