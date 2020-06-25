#!/bin/sh
pkill evince
rm ep1.4.pdf
afterwriting --source ep1.4.fountain --pdf ep1.4.pdf
scp -C ep1.4.pdf ep.comphistpod.com:/var/www/episodes
evince ep1.4.pdf&

