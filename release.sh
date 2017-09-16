set -ex

USERNAME=andthensome
IMAGE=alpine-hugo-git-bash

git pull

# bump version
sudo docker run --rm -v "$PWD":/app treeder/bump patch
version=`cat VERSION`
echo "version: $version"

# run build
sudo env IMAGE_NAME=$IMAGE sh ./hooks/build

# tag it
git add -A
git commit -m "version $version"
git tag -a "$version" -m "version $version"
git push
git push --tags
