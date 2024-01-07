# Docker container of Ogre3d

## Build docker image

```
docker build --label ogre --build-arg OGRE_VERSION_TAG=v14.1.2 --tag ggjnez92/ogre-ubuntu22.04:14.1.2 .
```

> NOTE: change the OGRE_VERSION_TAG depending on the version of OGRE

## Push docker image

```
docker push ggjnez92/ogre-ubuntu22.04:14.1.2
```

## License

[Apache 2.0](./LICENSE.md)

## Contributions

All contributions are welcome
