#!/bin/bash
# -*- ENCODING: UTF-8 -*-

LD_LIBRARY_PATH="/opt/curl/lib:${LD_LIBRARY_PATH}" /usr/share/spotify/spotify "$@"
