#!/bin/sh
pkill evince
rm ep1.4.pdf
afterwriting --source ep1.4.txt --pdf ep1.4.pdf
evince ep1.4.pdf&

