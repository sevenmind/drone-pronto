#!/bin/bash

cd $DRONE_WORKSPACE

pronto run -f=$PLUGIN_FORMATTERS -r=$PLUGIN_RUNNER -c=$PLUGIN_COMMIT $PLUGIN_ARGS