#!/bin/sh

cd $DRONE_WORKSPACE

git fetch origin $PLUGIN_COMMIT:reference

pronto run -f=$PLUGIN_FORMATTERS -r=$PLUGIN_RUNNER -c=reference $PLUGIN_ARGS