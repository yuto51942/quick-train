#!/bin/bash

export DOCKER_BUILDKIT=1
SCRIPT_DIR=$(cd $(dirname $0); pwd)
tag_name="quick_train"

docker build --progress=tty -t ${tag_name}:latest .

echo ""
echo "docker run --rm --gpus all -v ${SCRIPT_DIR}/core:/core -v ${SCRIPT_DIR}/tools:/tools -i -t ${tag_name}:latest /bin/bash"
