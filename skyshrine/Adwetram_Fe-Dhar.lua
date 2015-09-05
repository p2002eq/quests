--Paladin

local quest_helper = require('velious_quest_helper');
local SKYSHRINE_ARMOR = quest_helper.SKYSHRINE_ARMOR;
local QUEST_TEXT = {
hail="I wish to speak only to the knights called paladins. If you are what I seek do you wish to partake of my quests?"
quests="Excellent. By serving my cause, you, in turn, will further your own. I require certain components to aid me and if you bring them to me, I shall reward you for your honorable service. You may choose from among these items: a helm, a breastplate, armplates, bracers, gauntlets, greaves, and boots."
}

local QUEST_ITEMS={
quest_helper:melee_helm(SKYSHRINE_ARMOR.Plate_Helmet, 24961), --helm
quest_helper:melee_breastplate(SKYSHRINE_ARMOR.Breastplate, 24956), --breastplate
quest_helper:melee_armplate(SKYSHRINE_ARMOR.Plate_Vambraces, 24958), --arms
quest_helper:melee_bracer(SKYSHRINE_ARMOR.Plate_Bracer, 24960), --bracer
quest_helper:melee_gauntlets(SKYSHRINE_ARMOR.Plate_Gauntlets, 24962) --glove
quest_helper:melee_legs(SKYSHRINE_ARMOR.Plate_Greaves, 24957) --leg
quest_helper:melee_boots(SKYSHRINE_ARMOR.Plate_Boots, 24959) -- boots
}
function event_say(e)
	quest_helper.quest_text_skyshrine(e, QUEST_TEXT, 1); --Need to check quest_text_skyshrine to make it works
end

function event_trade(e)
	quest_helper:quest_turn_in(e, 1, QUEST_ITEMS, quest_helper.SKYSHRINE_ARMOR_success) --Need to check SKYSHRINE_ARMOR_success to make sure it works
end