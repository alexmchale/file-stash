stash(1) -- UNIX File Stasher
=============================

## NAME

stash -- store unused files in a configurable location

## SYNOPSIS

    stash [--message MSG] [--stash PATH] FILES

## INSTALLATION

    gem install file-stash

## DESCRIPTION

Stash gets rid of files you are no longer interested in. Pass it a list of
files and it will move them to the path specified by the `STASH_PATH`
environment variable, or `~/.stash` by default. It places the files listed in a
folder based upon the current time within the stash.

You may specify an optional message with the `-m` or `--message` parameter.

    stash -m "Old css for TwitterClone" public/stylesheets/*.css cache/*.css

Those files would then be relocated to a folder named something like:

    /home/alexmchale/.stash/2010-09-01T19:35:01+00:00-old.css.for.twitterclone
