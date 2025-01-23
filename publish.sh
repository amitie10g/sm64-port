#!/bin/bash
set -e

docker login

echo "What do you want to name the tag?"
read TAG

docker pull amitie10g/sm64-port || true
docker build --cache-from=amitie10g/sm64-port -t amitie10g/sm64-port .
docker push amitie10g/sm64-port:latest
docker tag amitie10g/sm64-port amitie10g/sm64-port:$TAG
docker push amitie10g/sm64-port:$TAG
