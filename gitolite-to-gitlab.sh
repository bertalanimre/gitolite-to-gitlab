#!/bin/sh

if [ "$#" -ne 4 ]; then
  echo "Usage: $0 GITOLITE GITLAB_URL API_TOKEN GITLAB_USER" >&2
  echo "For example: $0 your.gitolite.com your.gitlab.com yoursecrettoken gitlab-username"
  echo "Real example: gitserver.mycompany.com gitlab.mycompany.com jfo!nci3é32_fk3 example.eric"
  exit 1
fi

GITOLITE=$1
GITLAB_URL=$2
API_TOKEN=$3
GITLAB_USER=$4

ssh git@$GITOLITE info | awk '/^[ @]*R/{print $NF}' | while read REPO_NAME

do
	REPO_NAME2=$(echo $REPO_NAME | sed -e 's/\//_/g')
	REPO_NAME3=$(echo $REPO_NAME | sed 's@.*/@@')
#	echo $REPO_NAME
#	echo $REPO_NAME2
#	echo $REPO_NAME3
	git clone --mirror git@$GITOLITE:$REPO_NAME.git
	curl -v -H "Content-Type:application/json" $GITLAB_URL/api/v3/projects?private_token=$API_TOKEN -d "{ \"name\": \"$REPO_NAME2\" }"
	cd $REPO_NAME3.git
	git remote set-url origin git@$GITLAB_URL:$GITLAB_USER/$REPO_NAME2.git
	git push
	cd ..
done

