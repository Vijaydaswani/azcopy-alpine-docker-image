# azcopy-alpine-docker-image
AZCopy docker image to copy content from one Azure storage account to another storage account every 15 minutes. 

As you see repository contain 2 files.

 - [ ] Dockerfile - In order to build the image out of it.
 - [ ] azcopy.sh - edit the azcopy.sh and source SAS URL of the storage account for SOURCE and DESTINATION respectively.
 
 ```console
 #!/bin/sh
NOW=$(date)
SOURCE=
DEST=
echo "${NOW} - Copy from one Storage account to another Storage account."
azcopy copy $SOURCE $DEST --recursive=true
```
