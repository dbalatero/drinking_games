#!/bin/sh
# Originally from:
#   http://lwn.net/Articles/322149/
#
# The rules:
#   1) Each player runs this script as root in succession,
#      which randomly writes to kernel memory.
#   2) First person to crash the machine drinks.
#   2a) If you run this on a production machine, whoever
#       crashes it must drink an entire fifth of hard liquor.
#
# Using /dev/mem as /dev/kmem is not available on newer distros.
#
# TODO(dbalatero): Get the offsets right

sudo dd if=/dev/urandom of=/dev/mem bs=1 count=1 seek=0 skip=$RANDOM
