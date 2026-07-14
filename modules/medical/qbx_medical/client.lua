local medical = {}

---@param serverId number
---@return boolean
function medical.isPlayerDead(serverId)
    return Player(serverId).state?.isDead or false
end

---@param value number
function medical.overrideMaxHealth(value)
    -- Integrations with other resources
end

if bridge.name == bridge.currentResource then
    RegisterNetEvent("qbx_core:client:onSetMetaData", function(key, _, value)
        if key ~= "isdead" and key ~= "inlaststand" then return end
        if value == true or value == "true" then
            TriggerServerEvent("tq_bridge:server:revived")
            TriggerEvent("tq_bridge:client:revived")
            return
        end

        TriggerServerEvent("tq_bridge:server:died")
        TriggerEvent("tq_bridge:client:died")
    end)
end

return medical
