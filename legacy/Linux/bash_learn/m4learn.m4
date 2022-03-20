#!/usr/bin/env m4
dnl# vim: filetype=m4
divert(-1) # not output


define(`H2_COUNT', 0)
define(`H2',
	`define(`H2_COUNT', incr(H2_COUNT))<h2>H2_COUNT. $1</h2>')

define(PATH, /usr/share)
define(name, `syscmd(whoami)')

changequote({,})
define(x, {len(12345)})
changequote(`,')
dnl sysval

define(`forloop',
       `pushdef(`$1', `$2')_forloop(`$1', `$2', `$3', `$4')popdef(`$1')')
define(`_forloop',
       `$4`'ifelse($1, `$3', ,
		   `define(`$1', incr($1))_forloop(`$1', `$2', `$3', `$4')')')

define(X, y)
define(y, z)
define(`z', a)

divert(1)dnl # out
forloop(`i', 1, 100, `i ')
dnl
<html>
X
`X'
name
x
some(x)
H2(hi)
H2(PATH)
ifelse(PATH, /usr/share, H2(T), F)
ifelse(PATH, usr/share, H2(T), F)
</html>
define(pwd_dir, `syscmd(pwd)')
pwd_dir
pwd_dir
