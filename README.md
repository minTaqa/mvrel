# mvrel

Move a directory, rewriting each relative symbolic link so that the referent is the same.

From my [Unix stackexchange question](https://unix.stackexchange.com/questions/485320/what-is-a-good-command-for-moving-a-directory-containing-relative-symbolic-links).

Example:

    $ touch bar
    $ mkdir foo
    $ ln -sr bar foo
    $ readlink foo/bar
    ../bar
    $ mkdir baz
    $ mvrel foo baz
    Rewriting links
    Moving foo to baz
    $ readlink baz/foo/bar
    ../../bar
    $ mkdir qux
    $ mvrel baz qux
    Rewriting links
    Moving baz to qux
    $ readlink qux/baz/foo/bar
    ../../../bar
    $ mvrel qux/baz/foo/ qux/
    Rewriting links
    Moving qux/baz/foo/ to qux/
    $ readlink qux/foo/bar
    ../../bar
    $ mvrel qux/foo ../
    Rewriting links
    Moving qux/foo to ../
    $ readlink ../foo/bar
    ../tmp/bar
