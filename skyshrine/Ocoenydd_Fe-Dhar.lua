--magician

local quest_helper = require('velious_quest_helper');
local SKYSHRINE_ARMOR = quest_helper.SKYSHRINE_ARMOR;

local QUEST_TEXT = {
  hail="Greetings to you. I seek those who call themselves magicians. Are you a magician, little one?",
  magician="I thought so. I have several tasks for you accomplish. Once you have completed them I will have a cap, a robe, sleeves, wristbands, gloves, leggings and boots to reward you with.",

}

QUEST_TEXT = quest_helper.merge_tables(QUEST_TEXT, quest_helper.SKYSHRINE_SILK_TEXT);


local QUEST_ITEMS = {
	quest_helper:silk_helmet(SKYSHRINE_ARMOR.Silk_Turban, 31168), -- helm
	quest_helper:silk_chest(SKYSHRINE_ARMOR.Silk_Robe, 31169), -- chest
	quest_helper:silk_arms(SKYSHRINE_ARMOR.Silk_Sleeves, 31170), -- arms
	quest_helper:silk_bracer(SKYSHRINE_ARMOR.Silk_Wristband, 31171), -- wrist
	quest_helper:silk_gloves(SKYSHRINE_ARMOR.Silk_Gloves, 31172), -- gloves
	quest_helper:silk_legs(SKYSHRINE_ARMOR.Silk_Pantaloons, 31173), -- legs
	quest_helper:silk_boots(SKYSHRINE_ARMOR.Silk_Boots, 31174), -- boots
}

function event_say(e)
    quest_helper.quest_text_skyshrine(e, QUEST_TEXT, 1);
end


function event_trade(e)
	quest_helper:quest_turn_in(e, 1, QUEST_ITEMS, quest_helper.skyshrine_armor_success) 
end

