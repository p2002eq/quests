--enchanter

local quest_helper = require('velious_quest_helper');
local SKYSHRINE_ARMOR = quest_helper.SKYSHRINE_ARMOR;

local QUEST_TEXT = {
    hail="Greetings to you. I seek those who call themselves enchanters. Are you what I seek?",
    enchanter=("I thought so. I have several tasks for you accomplish. Once you have completed them I will have a cap, a robe, sleeves, wristbands, gloves, leggings and boots to reward you with.",

}

QUEST_TEXT = quest_helper.merge_tables(QUEST_TEXT, quest_helper.SKYSHRINE_SILK_TEXT);


local QUEST_ITEMS = {
	quest_helper:caster_helmet(SKYSHRINE_ARMOR.Silk_Turban, 31161), -- helm
	quest_helper:caster_chest(SKYSHRINE_ARMOR.Silk_Robe, 31162), -- chest
	quest_helper:caster_arms(SKYSHRINE_ARMOR.Silk_Sleeves, 31163), -- arms
	quest_helper:caster_bracer(SKYSHRINE_ARMOR.Silk_Wristband, 31164), -- wrist
	quest_helper:caster_gloves(SKYSHRINE_ARMOR.Silk_Gloves, 31165), -- gloves
	quest_helper:caster_legs(SKYSHRINE_ARMOR.Silk_Pantaloons, 31166), -- legs
	quest_helper:caster_boots(SKYSHRINE_ARMOR.Silk_Boots, 31167) -- boots
}

function event_say(e)
    quest_helper.quest_text_skyshrine(e, QUEST_TEXT, 1);
end


function event_trade(e)
	quest_helper:quest_turn_in(e, 1, QUEST_ITEMS, quest_helper.skyshrine_armor_success) 
end

