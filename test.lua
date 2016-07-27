local LibFilters = LibStub("LibFilters-2.0")

SLASH_COMMANDS["/testfilters"] = function()
    local filterTag = "TEST"
    local filterTypes = {
        LF_INVENTORY, LF_BANK_WITHDRAW, LF_BANK_DEPOSIT, LF_GUILDBANK_WITHDRAW,
        LF_GUILDBANK_DEPOSIT, LF_VENDOR_BUY, LF_VENDOR_SELL, LF_VENDOR_BUYBACK,
        LF_VENDOR_REPAIR, LF_GUILDSTORE_SELL, LF_MAIL_SEND, LF_TRADE,
        LF_SMITHING_REFINE, LF_SMITHING_DECONSTRUCT, LF_SMITHING_IMPROVEMENT,
        LF_SMITHING_RESEARCH, LF_ALCHEMY_CREATION, LF_ENCHANTING_CREATION,
        LF_ENCHANTING_EXTRACTION, LF_FENCE_SELL, LF_FENCE_LAUNDER, LF_CRAFTBAG,
    }
    local function filterCallback(...)
        table.insert(test[filterType], {...})
    end

    for _, filterType in pairs(filterTypes) do
        if LibFilters:IsFilterRegistered(filterTag, filterType) then
            d("Unregistering " .. filterType)
            LibFilters:UnregisterFilter(filterTag, filterType)
            LibFilters:RequestInventoryUpdate(filterType)
        else
            d("Registering " .. filterType)
            LibFilters:RegisterFilter(filterTag, filterType, filterCallback)
            LibFilters:RequestInventoryUpdate(filterType)
        end
    end
end