#!/bin/sh

e_running "Importing karabiner setting"

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set repeat.wait 50
/bin/echo -n .
$cli set repeat.initial_wait 200
/bin/echo -n .
$cli set remap.controlL2controlL_escape 1
/bin/echo -n .
/bin/echo

e_success "Done!"
