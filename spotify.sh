#!/bin/bash
# -*- ENCODING: UTF-8 -*-

LD_LIBRARY_PATH="/opt/curl/lib:${LD_LIBRARY_PATH}" LD_PRELOAD="/usr/lib/spotify/spotifywm.so" /usr/share/spotify/spotify "$@"
