#!/bin/bash
# -*- ENCODING: UTF-8 -*-

LD_LIBRARY_PATH="/opt/curl/lib:/usr/share/spotify:${LD_LIBRARY_PATH}" LD_PRELOAD="spotifywm.so" /usr/share/spotify/spotify "$@"
