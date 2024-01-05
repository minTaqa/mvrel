
streq () {
    if test "x$1" = "x$2"; then true
    else >&2 echo streq: "$1" was not equal to "$2"; false
    fi
}

TMPD=
setup () {
    export PATH=$(dirname $0)"/..":$PATH

    TMPD=$(mktemp -d trash-t-mvrel.XXXXXX --tmpdir)
    if [ $BATS_TEST_NUMBER = 1 ]; then
        # tell user how to clean up
        >&3 echo "Writing to $TMPD"
        >&3 echo "Using "$(which mvrel)
    fi
    cd $TMPD
}

teardown () {
    rm -rf $TMPD
}
