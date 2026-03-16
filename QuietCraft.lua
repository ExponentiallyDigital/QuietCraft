-- QuietCraft: filters out crafting messages from others while keeping your own

local playerName = UnitName("player")
local combinedPattern = "(creates:?)|has (created|crafted)"

local function FilterOtherCrafting(_, _, msg, sender)
    if not sender or not msg then
        return false
    end

    if sender == playerName then
        return false
    end

    local lowerMsg = msg:lower()
    return lowerMsg:find(combinedPattern, 1, true)
end

-- apply no duplicate filter registration
local function AddQuietCraftFilters()
    ChatFrame_AddMessageEventFilter("CHAT_MSG_TRADESKILLS", FilterOtherCrafting)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_SYSTEM", FilterOtherCrafting)
end

AddQuietCraftFilters()
