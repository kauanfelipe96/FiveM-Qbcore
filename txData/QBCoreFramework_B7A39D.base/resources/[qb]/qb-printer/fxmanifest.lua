fx_version 'cerulean'
game 'gta5'

description 'QB-Printer'
version '1.2.0'

ui_page 'html/index.html'

shared_scripts {
    'config.lua',
    '@qb-core/shared/locale.lua',
    'locales/en.lua', -- Change to the language you want
}

client_script {
    'client/main.lua',
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/ComboZone.lua',
    '@PolyZone/AddBoxZone',
    '@PolyZone/TargetModels'
}

server_script 'server/main.lua'

files {
    '*.lua',
    'html/*.html',
    'html/*.js',
    'html/*.css',
    'html/*.png',
}

lua54 'yes'
