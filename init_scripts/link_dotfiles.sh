#!/usr/bin/env bash

INSTALL_DIR="$1"
SCRIPT_NAME=$(basename $0)
TIMESTAMP=$(printf '%(%Y_%m_%d__%H_%M_%S)T\n')

if [ -z "$INSTALL_DIR" ]; then
    echo $SCRIPT_NAME ERROR: Please pass an Install Dir as argument
    exit 1
fi
if [ ! -d "$INSTALL_DIR" ]; then
    echo $SCRIPT_NAME ERROR: Install Dir \"$INSTALL_DIR\" does not exist!
    exit 1
fi

pushd .. > /dev/null

find . -type f -print0 | while read -r -d '' file; do

    echo $file | grep -q 'README\|git\|init_scripts' && continue

    fileDir=$(dirname $file)
    fileName=$(basename $file)
    linkDir=$(echo "$INSTALL_DIR/$fileDir" | tr -s / | sed 's:/./:/:g')
    relativePath=$(realpath -s --relative-to=$linkDir $fileDir)
    relativeFile=$relativePath/$fileName

    [ -e $linkDir ] || mkdir -p $linkDir

    pushd $linkDir > /dev/null
    [ -e $fileName ] && mv $fileName $fileName.$TIMESTAMP.orig
    ln -s $relativeFile $fileName
    popd > /dev/null

done

popd > /dev/null

