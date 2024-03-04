# Steps to push docker images to dockerhub

## Build docker image

```
docker build --label ogre --build-arg BULLET_VERSION_TAG=3.25 --build-arg OGRE_VERSION_TAG=v14.2.0 --tag ggjnez92/ogre-ubuntu22.04:14.2.0 .
```

> NOTE: change the OGRE_VERSION_TAG depending on the version of OGRE

## Push docker image

```
docker push ggjnez92/ogre-ubuntu22.04:14.2.0
```
