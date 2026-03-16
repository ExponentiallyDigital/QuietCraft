-- QuietCraft: filters out crafting messages from others while keeping your own
-- Author: arc909
-- Version: 0.0.2

local playerName = UnitName("player")
local craftPatterns = {
    "creates",
    "creates:",
    "has created",
    "has crafted",
}

local function FilterOtherCrafting(_, _, msg, sender)
    if not sender or not msg then
        return false
    end

    if sender == playerName then
        return false
    end

    -- single scan via pattern match table
    local lowerMsg = msg:lower()
    for _, token in ipairs(craftPatterns) do
        if lowerMsg:find(token, 1, true) then
            return true
        end
    end

    return false
end

-- apply no duplicate filter registration
local function AddQuietCraftFilters()
    ChatFrame_AddMessageEventFilter("CHAT_MSG_TRADESKILLS", FilterOtherCrafting)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_SYSTEM", FilterOtherCrafting)
end

AddQuietCraftFilters()