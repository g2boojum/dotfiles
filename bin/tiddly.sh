#! /bin/bash

pidof node > /dev/null
if [[ $? -ne 0 ]] ; then
    tiddlywiki $HOME/Dropbox/Tiddly/tiddlynodejs --server &
fi

