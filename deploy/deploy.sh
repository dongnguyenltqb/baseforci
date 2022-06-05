#!/bin/bash
echo "STEP DEPLOY"
echo "Current dir context"
ls -l
echo "Current build dir context"
ls -l build

if [[ $GITHUB_REF_TYPE == "tag" ]]; then	
	echo "deploying to production with tag: $GITHUB_REF_NAME"
fi

if [[ $GITHUB_REF_TYPE == "branch" ]]; then	
	jq --version
	docker version
	echo "building branch: $GITHUB_REF_NAME"
	docker build -t "backend:${GITHUB_REF_NAME}" -f Dockerfile .
	if [[ "$?" != 0 ]]; then	
		echo "build fail, exiting now"
		exit 1
	fi
	if [[ $GITHUB_REF_NAME == "master" ]] ; then
		echo "deploying to master"
	fi;
fi

echo "=> DONE.";
exit 0