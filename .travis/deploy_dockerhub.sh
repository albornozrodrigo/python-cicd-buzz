#!/bin/sh
docker login -u $DOCKER_USER -p $DOCKER_PASS
docker rm $TRAVIS_REPO_SLUG:$TAG .

if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
docker build -f Dockerfile -t $TRAVIS_REPO_SLUG:$TAG .
docker push $TRAVIS_REPO_SLUG
