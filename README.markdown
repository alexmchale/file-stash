stash(1) -- UNIX File Stasher
=============================

## NAME

stash -- store unused files in a configurable location

## SYNOPSIS

`stash` [--message MSG] [--stash PATH] FILES

## DESCRIPTION

Stash gets rid of files you are no longer interested in. Pass it a list of
files and it will move them to the path specified by the `STASH_PATH`
environment variable, or `~/.stash` by default. It places the files listed in a
folder based upon the current time within the stash.

You may specify an optional message with the `-m` or `--message` parameter.

    stash -m "Old css for TwitterClone" public/stylesheets/*.css cache/*.css
