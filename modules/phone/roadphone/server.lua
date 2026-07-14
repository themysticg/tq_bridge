local phone = {}

---@param src number
---@param _ number
---@param message string
function phone.sendMessage(src, _, message)
    TriggerClientEvent("tq_bridge:phone:sendMail", src, message)

    return true
end

---@param src number | string
---@param _ number
---@param coords vector3
function phone.sendCoords(src, _, coords)
    TriggerClientEvent("tq_bridge:phone:sendCoordsMail", src, coords)

    return true
end

---@param src number
---@param title string
---@param content? string
function phone.sendNotification(src, title, content)
    TriggerClientEvent("tq_bridge:phone:sendNotification", src, title, content)
end

return phone
