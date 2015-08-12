local ARMOR_GEMS = {
    Crushed_Coral=25831,
    Flawless_Diamond=25814,
    Flawed_Emerald=25821,
    Crushed_Flame_Emerald=25838,
    Crushed_Topaz=25832,
    Flawed_Sea_Sapphire=25825,
    Crushed_Black_Marble=25833
}
local THURG_ARMOR = {
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
local QUEST_TEXT = {
    hail="Greetin's, -name, you look like a -race who knows the value of a good bow when ye see one. I'll let ye in on a li'l secret, the bow is the greatest of all weapons as it allows you to inflict maximum punishment on yer foes with minimum risk. How can ye possibly go wrong? Or better yet, if'n ye be a ranger, I can see my way clear to making you a coif, tunic, sleeves, bracer, gauntlets, leggings, or boots that I'm sure ye would enjoy.",
    coif="To create a piece of armor to protect your sensitive skull. I will require three pieces of crushed coral as well as a corroded chain coif.",
    tunic="To forge a spectacular chain tunic I will require three flawless diamonds and a corroded chain tunic.  With the gems and my skills I may be able to draw out some of its magical powers.",
    sleeves="Protection for your arms will come at the price of three flawed emeralds and a set of corroded chain sleeves.",
    bracer="For the bracers, I will require a corroded chain bracer as well as three crushed flame emeralds. Return to me when you find such things -race",
    gauntlets="Protecting your hands is very important.  I can forge protection for your hands if you bring me a pair of corroded chain gauntlets and three crushed topaz.",
    leggings="A set of corroded chain leggings might be salvageable if you were to find three flawed sea sapphires.  With the right techniques and ingredients almost anything is possible.",
    boots="We use our feet so often, should not they be protected as well as any other portion of our bodies?  If you seek fine protection for your feet, return to me with three pieces of crushed black marble and a set of corroded chain boots."
}
function event_say(e)
    local faction = e.other:GetFaction(e.self);
    if (faction >= 3) then
        for trigger, text in pairs(QUEST_TEXT) do
            if (e.message:findi(trigger)) then
                text = text:gsub("(-name)", e.other:GetCleanName());
                text = text:gsub("(-race)", e.other:Race());
                text = text:gsub("(-class)", e.other:Class());
                e.self:Say(text);
            end
        end
    else
        e.self:Say("I do not know you well enough to entrust you with such a quest, yet.");
    end
end

local QUEST_ITEMS = {
    {turn_in={item1=ARMOR_GEMS.Crushed_Black_Marble, item2=ARMOR_GEMS.Crushed_Black_Marble, item3=ARMOR_GEMS.Crushed_Black_Marble, item4=THURG_ARMOR.Corroded_Chain_Boots}, reward=31020},
    {turn_in={item1=ARMOR_GEMS.Flawed_Sea_Sapphire, item2=ARMOR_GEMS.Flawed_Sea_Sapphire, item3=ARMOR_GEMS.Flawed_Sea_Sapphire, item4=THURG_ARMOR.Corroded_Chain_Leggings}, reward=31019}
}

function event_trade(e)
    local item_lib = require("items");
    local faction = e.other:GetFaction(e.self);
    if (faction >= 3) then
        for i, quest in ipairs(QUEST_ITEMS) do
            if(item_lib.check_turn_in(e.self, e.trade, quest.turn_in)) then
                e.other:SummonItem(quest.reward);
                thurg_armor_success(e);
                return;
            end
        end
    else
        item_lib.return_items(e.self, e.other, e.trade)
        e.self:Say("I do not know you well enough to entrust you with such a quest, yet.");
    end
    item_lib.return_items(e.self, e.other, e.trade);
end


function thurg_armor_faction(e)
    local COLDIAN = 49;
    local DAIN = 47;
    local KROMRIF = 188;
    local KROMZEK = 189;
    e.other:Faction(COLDIAN, 20);
    e.other:Faction(DAIN, 20);
    e.other:Faction(KROMRIF, -60);
    e.other:Faction(KROMZEK, -60);
end

function thurg_armor_success(e)
    e.other:AddEXP(100000);
    thurg_armor_faction(e);
    e.other:Ding();
    e.self:Emote("smiles warmly as he hands you your reward.");
    e.self:Say("You have done well.");
end
