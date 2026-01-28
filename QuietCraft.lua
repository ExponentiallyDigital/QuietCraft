-- QuietCraft: filters out crafting messages from other players while keeping your own
-- Author: arc909
-- Version: 0.0.1

local function FilterOtherCrafting(self, event, msg, sender)
    -- If the sender is you, allow it
    if sender == UnitName("player") then
        return false
    end

    -- Block other players' crafting messages
    if msg:find("creates") or msg:find("creates:") or msg:find("has created") or msg:find("has crafted") then
        return true
    end

    return false
end

-- Apply filter to both system channels that crafting messages use
ChatFrame_AddMessageEventFilter("CHAT_MSG_TRADESKILLS", FilterOtherCrafting)
ChatFrame_AddMessageEventFilter("CHAT_MSG_SYSTEM", FilterOtherCrafting)
