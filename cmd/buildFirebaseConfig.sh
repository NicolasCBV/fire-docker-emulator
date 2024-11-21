#!/bin/bash

if [ -f ./.firebaserc ]; then
	echo ".firebaserc already exist. Preserving it." 
	exit 0
fi

if [ -z "${FIREBASE_PROJECT}" ]; then
	echo "Could not find FIREBASE_PROJECT variable"
	exit 1
fi

json_fmt='{"projects":{"default":"%s"}}'
printf $json_fmt "${FIREBASE_PROJECT}" >> ./.firebaserc

if [ ! -z "${FIREBASE_JSON}" ]; then
	rm ./firebase.json
	printf $FIREBASE_JSON >> ./firebase.json
fi
