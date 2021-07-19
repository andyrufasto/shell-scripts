#!/bin/sh

### BEGIN INIT INFO
# Short-Description : Create a alarm sound if mpc is not playing music.
# Requires          : mpc.
### END INIT INFO

# Author: Andy Rufasto <andy@andyrufasto.cf>

mpc | sed -n 2p | grep playing || paplay /home/lain/.local/share/sounds/navi.ogg
