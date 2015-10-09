--shadowknight


local quest_helper = require('velious_quest_helper');
local KAEL_ARMOR = quest_helper.KAEL_ARMOR;

local QUEST_ITEMS = {
	quest_helper:melee_helmet(KAEL_ARMOR.Plate_Helmet, 25349), --Helm
	quest_helper:melee_breastplate(KAEL_ARMOR.Breastplate, 25350), -- Breastplate
	quest_helper:melee_armplate(KAEL_ARMOR.Plate_Vambraces, 25351), -- Arms
	quest_helper:melee_bracer(KAEL_ARMOR.Plate_Bracer, 25352), --Bracer
	quest_helper:melee_gauntlets(KAEL_ARMOR.Plate_Gauntlets, 25353), --gloves
	quest_helper:melee_legs(KAEL_ARMOR.Plate_Greaves, 25354), --legs
	quest_helper:melee_boots(KAEL_ARMOR.Plate_Boots, 25355), --boots
	
}
function event_say(e)
	if(e.other:GetFaction(e.self) < 2) then --Must be ally
		if(e.message:findi("hail")) then 
end

