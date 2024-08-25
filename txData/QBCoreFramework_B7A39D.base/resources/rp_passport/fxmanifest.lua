fx_version 'cerulean'
game 'gta5'

name 'Passport'
description 'Custom passport for RPRP'
author "DAMIGHTY"
description "React + Vite, TS"
version '1.0.0'

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
