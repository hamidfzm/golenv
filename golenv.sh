#!/usr/bin/env bash

help() {
    echo "Usage: golenv [OPTIONS] DEST_DIR"
    exit 1
}

init() {
    path="$PWD/$1"
    if [ -d "$path" ]; then
        echo "$path already exists."
    exit 73
    fi

    mkdir -p $path

    cp `dirname $0`/activate $path/activate


    sed -i "" "s|GOPATH=NOTSET|GOPATH=\"$path\"|" $path/activate


}

if [ $# -eq 0 ]; then
    help
else
    while [ $# != 0 ]
    do
        case "$1" in
        --help)
            help
            ;;
        *)
            init "$1"
            exit 0
            ;;
        esac
    done

fi
