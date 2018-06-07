#!/bin/bash
# -*- ENCODING: UTF-8 -*-

LD_PRELOAD='/opt/curl/lib/libcurl.so:/usr/lib/spotify/spotifywm.so' /usr/share/spotify/spotify "$@"
