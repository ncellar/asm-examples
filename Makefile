# "make clean" to remove object files, executables and libraries from the
# subfolders (recursive) of the folder in which the makefile resides.
#
# Requires bash (with the globstar option), ksh or zsh.
#
# USE WITH CAUTION

root := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))

default:
	echo "Invalid, only \"make clean\" is supported."

clean:
	cd $(root) && rm **/*.o **/*.exe **/*.dll **/*.a

.PHONY: default clean