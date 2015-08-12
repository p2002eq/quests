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
    Torn_Enchanted_Silk_Wristband=24953,
    Eroded_Leather_Boots=24945,
    Eroded_Leather_Bracelet=24946,
    Eroded_Leather_Cap=24947,
    Eroded_Leather_Gloves=24948,
    Eroded_Leather_Leggings=24943,
    Eroded_Leather_Sleeves=24944,
    Eroded_Leather_Tunic=24942
}
helper.SKYSHRINE_ARMOR = {
    Unadorned_Breastplate=24956,
    Unadorned_Chain_Boots=24966,
    Unadorned_Chain_Bracer=24967,
    Unadorned_Chain_Coif=24968,
    Unadorned_Chain_Gauntlets=24969,
    Unadorned_Chain_Leggings=24964,
    Unadorned_Chain_Sleeves=24965,
    Unadorned_Chain_Tunic=24963,
    Unadorned_Cloak_of_Battle=15843,
    Unadorned_Leather_Boots=24973,
    Unadorned_Leather_Bracelet=24974,
    Unadorned_Leather_Cap=24975,
    Unadorned_Leather_Gloves=24976,
    Unadorned_Leather_Leggings=24971,
    Unadorned_Leather_Sleeves=24972,
    Unadorned_Leather_Tunic=24970,
    Unadorned_Plate_Boots=24959,
    Unadorned_Plate_Bracer=24960,
    Unadorned_Plate_Gauntlets=24962,
    Unadorned_Plate_Greaves=24957,
    Unadorned_Plate_Helmet=24961,
    Unadorned_Plate_Vambraces=24958,
    Tattered_Silk_Boots=24980,
    Tattered_Silk_Gloves=24983,
    Tattered_Silk_Pantaloons=24978,
    Tattered_Silk_Robe=24977,
    Tattered_Silk_Sleeves=24979,
    Tattered_Silk_Turban=24982,
    Tattered_Silk_Wristband=24981
}
helper.KAEL_ARMOR{
    Ancient_Tarnished_Breastplate=24900,
    Ancient_Tarnished_Chain_Boots=24910,
    Ancient_Tarnished_Chain_Bracer=24911,
    Ancient_Tarnished_Chain_Coif=24912,
    Ancient_Tarnished_Chain_Gauntlets=24913,
    Ancient_Tarnished_Chain_Leggings=24908,
    Ancient_Tarnished_Chain_Sleeves=24909,
    Ancient_Tarnished_Chain_Tunic=24907,
    Ancient_Tarnished_Greaves=24901,
    Ancient_Tarnished_Plate_Boots=24903,
    Ancient_Tarnished_Plate_Bracelet=24904,
    Ancient_Tarnished_Plate_Gauntlets=24906,
    Ancient_Tarnished_Plate_Helmet=24905,
    Ancient_Tarnished_Vambraces=24902,
    Ancient_Silk_Boots=24924,
    Ancient_Silk_Gloves=24927,
    Ancient_Silk_Pantaloons=24922,
    Ancient_Silk_Robe=24921,
    Ancient_Silk_Sleeves=24923,
    Ancient_Silk_Turban=24926,
    Ancient_Silk_Wristband=24925,
    Ancient_Leather_Boots=24917,
    Ancient_Leather_Bracelet=24918,
    Ancient_Leather_Cap=24919,
    Ancient_Leather_Gloves=24920,
    Ancient_Leather_Leggings=24915,
    Ancient_Leather_Sleeves=24916,
    Ancient_Leather_Tunic=24914
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
