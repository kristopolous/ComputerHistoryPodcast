#!/bin/sh
pkill evince

rm ep1.4.pdf

version=$(git describe)

sed \
  -e "s/%GIT%/$version/g" \
  -e "s/%DATE%/$(git log -1 --format=%as)/g" \
  ep1.4.fountain \
  | afterwriting --source /dev/stdin --pdf ep1.4.pdf

echo http://ep.comphistpod.com/ep1.4-${version}.pdf

scp -C ep1.4.pdf ep.comphistpod.com:/var/www/episodes/ep1.4-${version}.pdf

evince ep1.4.pdf&

