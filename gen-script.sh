#!/bin/sh
pkill evince
rm ep1.4.pdf
afterwriting --source ep1.4.fountain --pdf ep1.4.pdf
evince ep1.4.pdf&

