#!/bin/bash

DIR=$1
BASE_URL=$2
AUTH=$3

if [ -z "$DIR" ]; then
	echo "Must specify directory to copy as first parameter" 
	exit 1
fi

if [ -z "$BASE_URL" ]; then
	echo "Must specify URL to copy to as second parameter"
	exit 1
fi

if [ -z "$AUTH" ]; then
	echo "Must specify username:password as third parameter"
	exit 1
fi

pushd $DIR

curl -X MKCOL -u $AUTH $BASE_URL

for subdir in `find * -type d`; do
	curl -X MKCOL -u $AUTH $BASE_URL/$subdir
done 

for file in `find * -type f`; do 
	curl -T $file  -u $AUTH $BASE_URL/$file 
done

popd