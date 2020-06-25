#!/bin/sh
pkill evince
rm ep1.4.pdf
sed "s/%GIT%/$(git describe)/g" ep1.4.fountain > /tmp/ep1.4
afterwriting --source /tmp/ep1.4 --pdf ep1.4.pdf
scp -C ep1.4.pdf ep.comphistpod.com:/var/www/episodes
evince ep1.4.pdf&

