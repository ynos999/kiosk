#!/bin/bash
# Copy from user "kiosk" Download directory to data folder.
mv -v -f /home/kiosk/Downloads/* /data/ > /srv/out.file 2> /srv/err.file
