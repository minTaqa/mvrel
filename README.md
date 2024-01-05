# mvrel

Move a set of files or directories, rewriting each relative symbolic link so that the referent is the same.

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

## TODO list:

- Allow destination to not be directory, like "mv"

- Allow moving of referents.

    Currently we only preserve symlink integrity when the link itself is moved (or part of a tree that is being moved). A related problem is to update a symlink when the referent moves. This is more difficult since for a given source path, we can't easily know who else is linking to it. But a simple version of this idea could be accomplished by accepting as command-line arguments one or more directories to scan for any symlinks (absolute or relative) pointing to the files which are being moved. This could be specified as root ("`/`") if you are prepared to wait a long time, or to a specific directory if you have some idea where a lot of symlinks you care about are living.

Done:

- (4 Nov 2023) Add "copy" mode (if invoked as cprel)
- (31 Jul 2023) Accept multiple source paths on command line, like "mv"
