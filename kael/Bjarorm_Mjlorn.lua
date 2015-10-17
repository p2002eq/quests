--necro

local quest_helper = require('velious_quest_helper');
local KAEL_ARMOR = quest_helper.KAEL_ARMOR;

local QUEST_TEXT = {
	hail="I seek those who practice the dark magicks. I seek those who call themselves necromancers. Are you a necromancer?",
	necromancer="Excellent. Are you sure enough of your skills to undertake my tasks? If not, get out of my sight, weakling!",
	tasks="I thought so. One should never back down from a challenge. Once you have completed them I will have a cap, a robe, sleeves, wristbands, gloves, leggings and boots to reward you with."
}


QUEST_TEXT = quest_helper.merge_tables(QUEST_TEXT, quest_helper.KAEL_SILK_TEXT);

local QUEST_ITEMS = {

	quest_helper:silk_helmet(KAEL_ARMOR.Silk_Turban, 25412),
	quest_helper:silk_chest(KAEL_ARMOR.Silk_Robe, 25413),
	quest_helper:silk_arms(KAEL_ARMOR.Silk_Sleeves, 25414),
	quest_helper:silk_bracer(KAEL_ARMOR.Silk_Wristband, 25415),
	quest_helper:silk_gloves(KAEL_ARMOR.Silk_Gloves, 25416),
	quest_helper:silk_legs(KAEL_ARMOR.Silk_Pantaloons, 25417),
	quest_helper:silk_boots(KAEL_ARMOR.Silk_Boots, 25418),
}

function event_say(e)
	quest_helper.quest_text(e, QUEST_TEXT, 1);
end

function event_trade(e)
	quest_helper:quest_turn_in(e, 1, QUEST_ITEMS, quest_helper.kael_armor_success);
end

