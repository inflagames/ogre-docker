# Ogre3d docker

Docker container with basic dependencies and capabilities to build an Ogre3d project in Ubuntu 22.04.

**Tools Available**

- Ogre3d: v14.2.0
- CMake: v3.28.1
- Bullet (physics): 3.25

> Note: CMake v3.28.1 is configured in the docker image by default.

## Build my project

To build your project, run the next command on the root directory of your project.

```
docker run -v .:/app -w /app ggjnez92/ogre-ubuntu22.04:14.2.0 sh -c "mkdir build && cd build && cmake .. && make"
```

> Note: next example only build the project and generate binary using cmake configuration of the project.
> Any needed dependency, should be installed/configurated in the docker image to be used.

## License

[Apache 2.0](./LICENSE.md)

## [DockerHub integration](./DOCKER.md)

## Contributions

All contributions are welcome
