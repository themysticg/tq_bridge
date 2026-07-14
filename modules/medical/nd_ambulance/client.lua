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
    AddStateBagChangeHandler('isDead', ('player:%s'):format(cache.serverId), function(_bagName, _key, value)
        if not value then
            TriggerServerEvent("tq_bridge:server:revived")
            TriggerEvent("tq_bridge:client:revived")
            return
        end

        TriggerServerEvent("tq_bridge:server:died")
        TriggerEvent("tq_bridge:client:died")
    end)
end

return medical
