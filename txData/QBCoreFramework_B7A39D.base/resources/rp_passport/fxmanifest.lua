fx_version 'cerulean'
game 'gta5'

description 'QB-Printer'
version '1.2.0'

ui_page 'ui/dist/index.html'

shared_scripts {
    '@ox_lib/init.lua',
}

client_script {
    'client/main.lua',
}

server_script 'server/main.lua'

files {
    'ui/dist/*.html',
    'ui/dist/**/*',
}

lua54 'yes'
