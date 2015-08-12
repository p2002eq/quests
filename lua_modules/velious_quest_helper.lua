local helper = {}

helper.ARMOR_GEMS = {
    Crushed_Coral=25831,
    Flawless_Diamond=25814,
    Flawed_Emerald=25821,
    Crushed_Flame_Emerald=25838,
    Crushed_Topaz=25832,
    Flawed_Sea_Sapphire=25825,
    Crushed_Black_Marble=25833
}
helper.THURG_ARMOR = {
    Corroded_Chain_Boots=24938,
    Corroded_Chain_Bracer=24939,
    Corroded_Chain_Coif=24940,
    Corroded_Chain_Gauntlets=24941,
    Corroded_Chain_Leggings=24936,
    Corroded_Chain_Sleeves=24937,
    Corroded_Chain_Tunic=24935,
    Corroded_Plate_Boots=24931,
    Corroded_Plate_Bracer=24932,
    Corroded_Plate_Gauntlets=24934,
    Corroded_Plate_Greaves=24929,
    Corroded_Plate_Helmet=24933,
    Corroded_Plate_Vambraces=24930,
    Torn_Enchanted_Silk_Boots=24952,
    Torn_Enchanted_Silk_Gloves=24955,
    Torn_Enchanted_Silk_Pantaloons=24950,
    Torn_Enchanted_Silk_Robe=24949,
    Torn_Enchanted_Silk_Sleeves=24951,
    Torn_Enchanted_Silk_Turban=24954,
    Torn_Enchanted_Silk_Wristband=24953
}

function helper.quest_text(e, table)
    for trigger, text in pairs(table) do
        if (e.message:findi(trigger)) then
            text = text:gsub("(-name)", e.other:GetCleanName());
            text = text:gsub("(-race)", e.other:Race());
            text = text:gsub("(-class)", e.other:Class());
            e.self:Say(text);
            return;
        end
    end
end

function helper.quest_turn_in(e, faction_req, items, callback)
    local item_lib = require("items");
    local faction = e.other:GetFaction(e.self);
    if (faction >= faction_req) then
        for i, quest in ipairs(items) do
            if(item_lib.check_turn_in(e.self, e.trade, quest.turn_in, true)) then
                e.other:SummonItem(quest.reward);
                callback(e);
                return;
            end
        end
    else
        item_lib.return_items(e.self, e.other, e.trade)
        e.self:Say("I do not know you well enough to entrust you with such a quest, yet.");
    end
end

function helper.thurg_armor_faction(e)
    local COLDIAN = 49;
    local DAIN = 47;
    local KROMRIF = 188;
    local KROMZEK = 189;
    e.other:Faction(COLDIAN, 20);
    e.other:Faction(DAIN, 20);
    e.other:Faction(KROMRIF, -60);
    e.other:Faction(KROMZEK, -60);
end

function helper.thurg_armor_success(e)
    e.other:AddEXP(100000);
    helper.thurg_armor_faction(e);
    e.other:Ding();
    e.self:Emote("smiles warmly as he hands you your reward.");
    e.self:Say("You have done well.");
end

return helper;
