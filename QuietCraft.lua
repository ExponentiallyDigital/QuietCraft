-- QuietCraft: filters out crafting messages from others while keeping your own

local playerName = UnitName("player")

local function FilterOtherCrafting(self, event, msg, sender)
    if not msg then
        return false
    end

    local lowerMsg = msg:lower()

    -- keep all personal craft reports (e.g. "You create ...")
    if lowerMsg:find("you create") then
        return false
    end

    -- only apply filtering for tradeskill system messages
    local isCraft = lowerMsg:find("creates:?") or lowerMsg:find("has created") or lowerMsg:find("has crafted")
    if not isCraft then
        return false
    end

    -- allow your own messages through
    if sender and (sender == playerName or sender:match("^" .. playerName .. "%-")) then
        return false
    end

    -- filter all other players' craft messages
    return true
end

-- apply no duplicate filter registration
local function AddQuietCraftFilters()
    ChatFrame_AddMessageEventFilter("CHAT_MSG_TRADESKILLS", FilterOtherCrafting)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_SYSTEM", FilterOtherCrafting)
end

AddQuietCraftFilters()
