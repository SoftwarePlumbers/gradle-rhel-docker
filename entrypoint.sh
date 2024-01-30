#!/bin/bash -l
# Detect if running as a github action, and if so run gradle in the build directory. Otherwise start a shell.

if [ -d /github/workspace ]; then
    cd /github/workspace
    export GRADLE_USER_HOME=/github/workspace
    gradle $* --console=plain
else
    exec /bin/bash
fi
