# tq_bridge

A framework bridge for FiveM resources in the Three Queens ecosystem. Instead of writing support for multiple frameworks, inventories, or phone systems directly in each script, resources use tq_bridge to get a unified API that is independent of the underlying tech stack.

## Dependencies

- [`ox_lib`](https://github.com/overextended/ox_lib)
- [`oxmysql`](https://github.com/overextended/oxmysql)

## Installation

1. Place `tq_bridge` in your `resources` folder.
2. Add `ensure tq_bridge` to `server.cfg` **before** any resources that depend on it.
3. Configure `config.lua` (see section below).
4. Start the server.

---

## Configuration (`config.lua`)

```lua
BridgeConfig = {
    VersionCheck = true,   -- check resource version on start
    Debug        = false,  -- enable debug logging

    -- Framework selection
    FrameWork  = "qbx_core",         -- qbx_core | qb-core | es_extended | nd_core

    -- External systems
    Inventory   = "ox_inventory",    -- ox_inventory | origen_inventory | tgiann_inventory
    Phone       = "lb-phone",        -- lb-phone | yseries | yphone | yflip | npwd | roadphone | 17mov_phone | gksphone
    Target      = "ox_target",       -- ox_target | qb-target | sleepless_interact
    Medical     = "qbx_medical",     -- qbx_medical | esx_ambulancejob | nd_ambulance
    Dispatch    = "ps-dispatch",     -- ps-dispatch | origen_police | cd_dispatch | rcore_dispatch
    VehicleKeys = "qbx_vehiclekeys", -- qbx_vehiclekeys | cd_garage | mVehicle | okokGarage | wasabi_carlock | mrnewbvehiclekeys | Renewed-Vehiclekeys | ...
    VehicleFuel = "ox_fuel",         -- ox_fuel | LegacyFuel | cdn-fuel | lc_fuel | qb-fuel | Renewed-Fuel
    Minigames   = "tq_minigamesv2",

    -- Loot rarity weights
    LootRarityWeights = {
        ["COMMON"]    = 800,
        ["RARE"]      = 150,
        ["EPIC"]      = 45,
        ["LEGENDARY"] = 5,
    },
}
```
---

## Module Architecture

The `modules/` folder contains implementations for external resources. Each category has its own subfolder:

```
modules/
├── fw/          # frameworks  (qbx_core, qb-core, es_extended, nd_core)
├── inv/         # inventories (ox_inventory, origen_inventory, tgiann_inventory)
├── target/      # targeting   (ox_target, qb-target, sleepless_interact)
├── dispatch/    # dispatch    (ps-dispatch, origen_police, cd_dispatch, rcore_dispatch)
├── medical/     # medical     (qbx_medical, esx_ambulancejob, nd_ambulance)
├── phone/       # phones      (lb-phone, yseries, yphone, npwd, ...)
├── vkeys/       # vehicle keys
├── vfuel/       # vehicle fuel
├── minigames/   # minigames
├── log/         # Discord logging
└── sound/       # sound system
```

Each module is loaded automatically based on the values in `BridgeConfig`. The selected module exposes a unified API available through the global `bridge` table.

For instructions on adding a new framework or system, see [`docs/how-to-add-new-module.md`](docs/how-to-add-new-module.md).

---

## Utility Modules

### sounds

Client-side playback of `.ogg` audio files. Available through the unified bridge API:

```lua
bridge.sound.play(soundName, volume?)
bridge.sound.playSpatial(soundName, coords, volume?, maxDistance?)
```

Place audio files in the `sounds/` folder as `*.ogg`.

---

## Credits

tq_bridge's bridge/module architecture was originally derived from **prp-bridge** by **ProdigyPRP** ([ProdigyPRP](https://github.com/ProdigyPRP)). Full credit and thanks to the ProdigyPRP team for the original work, which is distributed under its own license. Portions of this project retain that structure and are used in accordance with those terms.

---

## License

tq_bridge is licensed under the **GNU Lesser General Public License v3.0 or later (LGPL-3.0-or-later)**.

This resource is built on top of [ox_lib](https://github.com/CommunityOx/ox_lib) (Copyright © 2025 Overextended), which is distributed under the same license. In accordance with the LGPL-3.0 terms and the ox_lib [NOTICE](https://github.com/CommunityOx/ox_lib/blob/main/NOTICE.md), the following conditions apply:

- Credit must be given to the original authors and a link to the original project must be provided.
- Any modifications to the original work must be documented.
- The full LGPL-3.0 license text must be included with any distribution.
- This project must remain available under the LGPL-3.0 or a compatible open-source license.
- All existing copyright and licensing notices must be preserved.
