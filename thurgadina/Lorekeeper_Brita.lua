--Enchanter

local quest_helper = require('velious_quest_helper');
local THURG_ARMOR = quest_helper.THURG_ARMOR;
local QUEST_TEXT = {
    hail="Greetings to you.  I seek those who call themselves enchanters.  Are you an enchanter?",
	enchanter="I thought so.  I have several tasks for you accomplish.  Once you have completed them I will have a cap, a robe, sleeves, wristbands, gloves, leggings and boots to reward you with.",

}

QUEST_TEXT = quest_helper.merge_tables(QUEST_TEXT, quest_helper.THURG_SILK_TEXT);

local QUEST_ITEMS = {
    -- boots
    quest_helper:silk_boots(THURG_ARMOR.Silk_Boots, 31077),
    -- legs
    quest_helper:silk_legs(THURG_ARMOR.Silk_Pantaloons, 31078),
    -- gloves
    quest_helper:silk_gloves(THURG_ARMOR.Silk_Gloves, 31079),
    -- wrist
    quest_helper:silk_bracer(THURG_ARMOR.Silk_Wristband, 31080),
    -- arms
    quest_helper:silk_arms(THURG_ARMOR.Silk_Sleeves, 31081),
    -- chest
    quest_helper:silk_chest(THURG_ARMOR.Silk_Robe, 31082),
    -- helm
    quest_helper:silk_helmet(THURG_ARMOR.Silk_Turban, 31083),
}

function event_say(e)
    quest_helper.quest_text(e, QUEST_TEXT, 3);
end

--
function event_trade(e)

	local item_lib = require('items');

	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 1427, item2 = 1417})) then
		e.self:Say("Ohh, that's better. I get so touchy when I'm hungry. I should probably go apologize to Derrin for being snappy. Please return this to Mordin for me.");
		e.other:QuestReward(e.self, 0, 0, 0, 0, 1424, 150000);
		e.other:Faction(49, 20); --coldain
		e.other:Faction(67, 20); --Dain
		e.other:Faction(188, -60); --kromrif
		e.other:Faction(189, -60); --kromzek
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 =  1427})) then
		e.self:Say("Ohh, that's better. I get so touchy when I'm hungry. I should probably go apologize to Derrin for being snappy.");
		e.other:AddEXP(5000);
	end
    quest_helper:quest_turn_in(e, 3, QUEST_ITEMS, quest_helper.thurg_armor_success)
end
