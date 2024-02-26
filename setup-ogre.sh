#!/usr/bin/env bash

HELP=$(cat <<-END
Usage: ./setup-ogre.sh [OGRE_VERSION_TAG]

Setup Ogre in the system given the tag version.

OGRE_VERSION_TAG: default value is v14.2.0
.
END
)

if [ "$1" = "-h" ] || [ "$1" = "help" ]; then
  echo "$HELP"
else

  # Set ogre version
  OGRE_VERSION_TAG="${OGRE_VERSION_TAG:-v14.2.0}";
  echo "Ogre version: $OGRE_VERSION_TAG"

  git clone https://github.com/OGRECave/ogre.git
  cd ogre

  git checkout $OGRE_VERSION_TAG

  # Build ogre
  cmake .
  cmake --build . --config Release

  # Install ogre
  cmake --build . --config Release --target install

  # Remove ogre repo
  cd ..
  rm -rf ogre

fi
