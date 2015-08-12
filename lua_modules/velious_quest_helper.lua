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
    Chain_Boots=24938,
    Chain_Bracer=24939,
    Chain_Coif=24940,
    Chain_Gauntlets=24941,
    Chain_Leggings=24936,
    Chain_Sleeves=24937,
    Chain_Tunic=24935,
    Plate_Boots=24931,
    Breastplate=24928,
    Plate_Bracer=24932,
    Plate_Gauntlets=24934,
    Plate_Greaves=24929,
    Plate_Helmet=24933,
    Plate_Vambraces=24930,
    Silk_Boots=24952,
    Silk_Gloves=24955,
    Silk_Pantaloons=24950,
    Silk_Robe=24949,
    Silk_Sleeves=24951,
    Silk_Turban=24954,
    Silk_Wristband=24953,
    Leather_Boots=24945,
    Leather_Bracelet=24946,
    Leather_Cap=24947,
    Leather_Gloves=24948,
    Leather_Leggings=24943,
    Leather_Sleeves=24944,
    Leather_Tunic=24942
}
helper.SKYSHRINE_ARMOR = {
    Breastplate=24956,
    Chain_Boots=24966,
    Chain_Bracer=24967,
    Chain_Coif=24968,
    Chain_Gauntlets=24969,
    Chain_Leggings=24964,
    Chain_Sleeves=24965,
    Chain_Tunic=24963,
    Leather_Boots=24973,
    Leather_Bracelet=24974,
    Leather_Cap=24975,
    Leather_Gloves=24976,
    Leather_Leggings=24971,
    Leather_Sleeves=24972,
    Leather_Tunic=24970,
    Plate_Boots=24959,
    Plate_Bracer=24960,
    Plate_Gauntlets=24962,
    Plate_Greaves=24957,
    Plate_Helmet=24961,
    Plate_Vambraces=24958,
    Silk_Boots=24980,
    Silk_Gloves=24983,
    Silk_Pantaloons=24978,
    Silk_Robe=24977,
    Silk_Sleeves=24979,
    Silk_Turban=24982,
    Silk_Wristband=24981
}
helper.KAEL_ARMOR = {
    Chain_Boots=24910,
    Chain_Bracer=24911,
    Chain_Coif=24912,
    Chain_Gauntlets=24913,
    Chain_Leggings=24908,
    Chain_Sleeves=24909,
    Chain_Tunic=24907,
    Plate_Breastplate=24900,
    Plate_Greaves=24901,
    Plate_Boots=24903,
    Plate_Bracelet=24904,
    Plate_Gauntlets=24906,
    Plate_Helmet=24905,
    Plate_Vambraces=24902,
    Silk_Boots=24924,
    Silk_Gloves=24927,
    Silk_Pantaloons=24922,
    Silk_Robe=24921,
    Silk_Sleeves=24923,
    Silk_Turban=24926,
    Silk_Wristband=24925,
    Leather_Boots=24917,
    Leather_Bracelet=24918,
    Leather_Cap=24919,
    Leather_Gloves=24920,
    Leather_Leggings=24915,
    Leather_Sleeves=24916,
    Leather_Tunic=24914
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

function helper:quest_turn_in(event, faction_req, items, callback)
    local item_lib = require("items");
    local faction = event.other:GetFaction(event.self);
    event.self:Say("hi");
    if (faction >= faction_req) then
        for i, quest in ipairs(items) do
            if(item_lib.check_turn_in(event.self, event.trade, quest.turn_in, true)) then
                event.other:SummonItem(quest.reward);
                callback(self, event);
                return;
            end
        end
    else
        item_lib.return_items(event.self, event.other, event.trade)
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

function helper:thurg_armor_success(e)
    e.other:AddEXP(100000);
    self.thurg_armor_faction(e);
    e.other:Ding();
    e.self:Emote("smiles warmly as he hands you your reward.");
    e.self:Say("You have done well.");
end

function helper:quest_turn_in_item(gem, armor, reward)
    return {turn_in={item1=gem, item2=gem, item3=gem, item4=armor}, reward=reward}
end

function helper:melee_boots(armor, reward)
   return self:quest_turn_in_item(self.ARMOR_GEMS.Crushed_Black_Marble, armor, reward)
end

function helper:melee_legs(armor, reward)
   return self:quest_turn_in_item(self.ARMOR_GEMS.Flawed_Sea_Sapphire, armor, reward)
end

function helper:melee_gloves(armor, reward)
   return self:quest_turn_in_item(self.ARMOR_GEMS.Crushed_Topaz, armor, reward)
end

function helper:melee_bracer(armor, reward)
   return self:quest_turn_in_item(self.ARMOR_GEMS.Crushed_Flame_Emerald, armor, reward)
end

function helper:melee_helmet(armor, reward)
   return self:quest_turn_in_item(self.ARMOR_GEMS.Crushed_Coral, armor, reward)
end

function helper:melee_arms(armor, reward)
   return self:quest_turn_in_item(self.ARMOR_GEMS.Flawed_Emerald, armor, reward)
end

function helper:melee_chest(armor, reward)
   return self:quest_turn_in_item(self.ARMOR_GEMS.Flawless_Diamond, armor, reward)
end

return helper;
