local medical = {}

---@param serverId number
---@return boolean
function medical.isPlayerDead(serverId)
    local state = Player(serverId).state
    return state?.isDead or state?.dead or false
end

---@param value number
function medical.overrideMaxHealth(value)
    -- Integrations with other resources
end

if bridge.name == bridge.currentResource then
    local cachedDeadState

    ---@param value any
    local function syncDeathState(value)
        local isDead = value == true
        if cachedDeadState == isDead then return end
        cachedDeadState = isDead

        if not isDead then
            TriggerServerEvent("tq_bridge:server:revived")
            TriggerEvent("tq_bridge:client:revived")
            return
        end

        TriggerServerEvent("tq_bridge:server:died")
        TriggerEvent("tq_bridge:client:died")
    end

    AddStateBagChangeHandler('isDead', ('player:%s'):format(cache.serverId), function(_bagName, _key, value)
        syncDeathState(value)
    end)

    AddStateBagChangeHandler('dead', ('player:%s'):format(cache.serverId), function(_bagName, _key, value)
        syncDeathState(value)
    end)
end

return medical
