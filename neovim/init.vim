call etc#utils#source_file('core/base.vim')

call etc#dein#init()

call etc#utils#source_file('core/config.vim')
call etc#utils#source_file('core/general.vim')
call etc#utils#source_file('core/filetype.vim')
call etc#utils#source_file('core/mappings.vim')

call etc#theme#init()
call etc#utils#source_file('core/colors.vim')
