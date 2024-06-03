#!/bin/sh

#/bin/corectrl -m PowerSave --minimize-systray
[[ -f ~/.xbindkeysrc ]] && xbindkeys || echo "No .xbindkeysrc file found"
