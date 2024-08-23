fx_version 'cerulean'
games { "gta5" }

name 'Loading Screen'
description 'Custom Loading Screen for FiveM'
author "DAMIGHTY"
description "React + Vite, TS, Tailwind "
version '1.0.0'

lua54 'yes'

loadscreen 'ui/dist/index.html'

client_script "client/*"

files {
    'ui/dist/index.html', 'ui/dist/**/*', 'ui/src/**/*'
}

-- loadscreen_manual_shutdown 'yes'



