fx_version "cerulean"
game "gta5"
lua54 "yes"

author "Three Queens"
description "tq_bridge - A framework bridge for Three Queens resources"
version "1.0.0"

ui_page "ui/index.html"

shared_scripts {
    "@ox_lib/init.lua",
    "config.lua",
    "vehicleConfig.lua",
    "import.lua",
    "shared.lua"
}

client_scripts {
    "main/client.lua",
    "utils/vehicleData.lua",
    "utils/tpToCoords.lua"
}

server_scripts {
    "@oxmysql/lib/MySQL.lua",
    "main/server.lua",
    "utils/versionCheck.lua",
    "utils/lootGenerator.lua",
    "utils/spawnVehicle.lua",
    "utils/vehicleData.lua"
}

escrow_ignore {
    "*.lua",
    "*/**.lua",
}

files {
    "modules/**/client.lua",
    "locales/*.json",
    "ui/**/*",
    "sounds/*.ogg",
}
