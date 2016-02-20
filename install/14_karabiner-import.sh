#!/bin/sh

e_header "Importing karabiner setting"

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set repeat.wait 50
$cli set repeat.initial_wait 200
$cli set remap.controlL2controlL_escape 1

e_success "Done!"
