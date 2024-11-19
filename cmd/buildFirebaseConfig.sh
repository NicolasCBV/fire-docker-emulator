#!/bin/bash

if [ -f ./.firebaserc ]; then
	echo ".firebaserc already exist" 
	exit 0
fi

if [ -z "${FIREBASE_PROJECT}" ]; then
	echo "Could not find FIREBASE_PROJECT variable"
	exit 1
fi

json_fmt='{"projects":{"default":"%s"}}'
printf $json_fmt "${FIREBASE_PROJECT}" >> ./.firebaserc

