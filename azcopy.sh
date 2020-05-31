#!/bin/sh

NOW=$(date)


SOURCE=
DEST=

echo "${NOW} - Copy from one Storage account to another Storage account."

azcopy copy $SOURCE $DEST --recursive=true
