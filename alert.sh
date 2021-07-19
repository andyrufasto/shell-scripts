#!/bin/sh

mpc | sed -n 2p | grep playing || paplay /home/lain/.local/share/sounds/navi.ogg
