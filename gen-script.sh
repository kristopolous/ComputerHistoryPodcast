#!/bin/sh
pkill evince

rm ep1.4.pdf

sed \
  -e "s/%GIT%/$(git describe)/g" \
  -e "s/%DATE%/$(git log -1 --format=%as)/g" \
  ep1.4.fountain \
  | afterwriting --source /dev/stdin --pdf ep1.4.pdf

scp -C ep1.4.pdf ep.comphistpod.com:/var/www/episodes

evince ep1.4.pdf&

