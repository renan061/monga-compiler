#!/bin/sh
clear

sh bin/compile-lex.sh
sh bin/compile-test.sh
sh bin/test.sh