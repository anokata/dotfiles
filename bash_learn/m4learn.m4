#!/usr/bin/env m4
# vim: filetype=sh

#changequote({,})

len(123)
some(11)
define(x, 8)
x
x x 
x()x
some(x)
define(PATH, /usr/share)

some PATH here

ifelse(PATH, /usr/share, T, F)

define(name, "syscmd(whoami)")
name
sysval

