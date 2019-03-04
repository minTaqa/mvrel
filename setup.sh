# put this directory in path, for e.g. testing local version

SCRIPT_DIR=$( cd ${0%/*} && pwd -P )

export PATH=$SCRIPT_DIR:$PATH
