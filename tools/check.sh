#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)

python ${SCRIPT_DIR}/../core/example/check.py
