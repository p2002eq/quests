-- necro 

local quest_helper = require('velious_quest_helper');
local SKYSHRINE_ARMOR = quest_helper.SKYSHRINE_ARMOR;
local QUEST_TEXT = {
	hail="I seek those who practice the dark magicks. I seek those who call themselves necromancers. Are you what I seek?"
	necromancer="Excellent. Are you sure enough of your skills to undertake my tasks? If not, get out of my sight weakling!"
	tasks="I thought so. I have several tasks for you accomplish. Once you have completed them I will have a cap, a robe, sleeves, wristbands, gloves, leggings and boots to reward you with."
	
	--If not factioned "You must prove your dedication to the Claws of Veeshan before I will speak to you."
}

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
	quest_helper.quest_text(e, QUEST_TEXT, 1); 
end

function event_trade(e)
	quest_helper:quest_turn_in(e, 1, QUEST_ITEMS, quest_helper.SKYSHRINE_ARMOR_success) 
end


#END of FILE Zone: skyshrine ID:114268 -- Abudan_Fe`Dhar