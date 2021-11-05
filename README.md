# Docker container of OGRE3d

## Build docker image

```
docker build --label ogre --build-arg OGRE_VERSION_TAG=v13.1.1 --tag ggjnez/ogre-ubuntu21:13.1.1 .
```

> NOTE: change the OGRE_VERSION_TAG depending on the version of OGRE

## Push docker image

```
docker push ggjnez/ogre-ubuntu21:13.1.1
```

## License

[Apache 2.0](./LICENSE.md)

## Contributions

All contributions are welcome
