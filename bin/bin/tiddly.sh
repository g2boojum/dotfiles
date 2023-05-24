#! /bin/bash

pidof node > /dev/null
if [[ $? -ne 0 ]] ; then
    tiddlywiki +plugins/tiddlywiki/filesystem +plugins/tiddlywiki/tiddlyweb "$HOME/BHTiddly" --listen &
fi

