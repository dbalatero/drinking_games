#!/usr/bin/env ruby
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

rand_offset = rand(1024 * 1024) # seek between [0, 1mb]
cmd = "sudo dd if=/dev/urandom of=/dev/mem bs=1k count=1 seek=#{rand_offset}"
system(cmd)
