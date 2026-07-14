BridgeConfig = {}

-- Version Check (we recommend leaving this true)
---@type boolean
BridgeConfig.VersionCheck = false

-- Enables debug prints
---@type boolean
BridgeConfig.Debug = false

--[[
    Available Frameworks:
        - qbx_core
        - qb-core
        - es_extended
        - nd_core
]]
---@type AvailableFrameworks
BridgeConfig.FrameWork = "qbx_core"

--[[
    Available inventories
        - ox_inventory
        - origen_inventory
        - tgiann-inventory
]]
---@type AvailableInventories
BridgeConfig.Inventory = "ox_inventory"

--[[
    Available phones
        - lb-phone
        - yseries
        - yphone
        - yflip
        - npwd
        - roadphone
        - 17mov_phone
        - gksphone
        - meteo-phone
]]
---@type AvailablePhones
BridgeConfig.Phone = "lb-phone"

--[[
    Available targets
        - ox_target
        - qb-target
        - sleepless_interact
]]
---@type AvailableTargets
BridgeConfig.Target = "ox_target"

--[[
    Available Medical systems:
        - qbx_medical
        - esx_ambulancejob
        - wasabi_ambulance (supports v1 and v2)
        - ars_ambulancejob
        - osp_ambulance
        - p-ambulancejob
        - nd_ambulance
        - qb-ambulancejob
        - randol_medical
]]
---@type AvailableMedicals
BridgeConfig.Medical = 'qbx_medical'

--[[
    Available Dispatch Resources:
        - ps-dispatch
        - origen_police
        - cd_dispatch
        - tk_dispatch
        - rcore_dispatch
        - lb-tablet
        - aty_dispatch
        - codem-dispatch
        - core_dispatch
]]
---@type AvailableDispatches
BridgeConfig.Dispatch = "ps-dispatch"

--[[
    AvailableVehicleKeys Resources:
        - qbx_vehiclekeys
        - cd_garage
        - mVehicle
        - okokGarage
        - qb-vehiclekeys
        - qbx_vehiclekeys
        - vehicles_keys
        - wasabi_carlock
        - nd_core
        - mrnewbvehiclekeys
        - Renewed-Vehiclekeys
]]
---@type AvailableVehicleKeys
BridgeConfig.VehicleKeys = "qbx_vehiclekeys"

--[[
    AvailableVehicleFuel Resources:
        - ox_fuel
        - LegacyFuel
        - cdn-fuel
        - lc_fuel
        - qb-fuel
        - Renewed-Fuel
]]
---@type AvailableVehicleFuel
BridgeConfig.VehicleFuel = "ox_fuel"

---@type AvailableMinigames
BridgeConfig.Minigames = "tq_minigamesv2"

---@type table<string, number>
BridgeConfig.LootRarityWeights = {
    ["COMMON"] = 800,
    ["RARE"] = 150,
    ["EPIC"] = 45,
    ["LEGENDARY"] = 5,
}