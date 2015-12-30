--warrior

local quest_helper = require('velious_quest_helper');
local KAEL_ARMOR = quest_helper.KAEL_ARMOR;

local QUEST_ITEMS = {
	quest_helper:melee_helmet(KAEL_ARMOR.Plate_Helmet, 25433), --Helm
	quest_helper:melee_chest(KAEL_ARMOR.Breastplate, 25434), -- Breastplate
	quest_helper:melee_arms(KAEL_ARMOR.Plate_Vambraces, 25435), -- Arms
	quest_helper:melee_bracer(KAEL_ARMOR.Plate_Bracer, 25436), --Bracer
	quest_helper:melee_gloves(KAEL_ARMOR.Plate_Gauntlets, 25437), --gloves
	quest_helper:melee_legs(KAEL_ARMOR.Plate_Greaves, 25438), --legs
	quest_helper:melee_boots(KAEL_ARMOR.Plate_Boots, 25439), --boots
	
}
function event_say(e)
	if (e.other:GetFaction(e.self) == 1) then
		if(e.message:findi("hail")) then
			e.self:Say("Greetings to you. I seek the service of a powerful warrior. Are you a warrior? If not then be gone.");
		elseif(e.message:findi("warrior")) then
			e.self:Say("Excellent. I see that you are a seasoned veteran of many battles. I admire your strength and ferocity. Life is but a series of battles, is it not?");
		elseif(e.message:findi("life is a series of battles")) then
			e.self:Say("We share the same view then. I wish to test your skills in battle. Not with me of course, for I will destroy you where you stand. Instead I wish for you to retrieve some trinkets for me and once I have them I will reward you handsomely with a helm, a breastplate, armplates, bracers, gauntlets, greaves, or boots.");
		elseif(e.message:findi("helm")) then
			e.self:Say("All I require are an ancient tarnished plate helmet and three crushed coral pieces. This should be a small task for one such as you. Go now and I shall await your return.");
		elseif(e.message:findi("breastplate")) then
			e.self:Say("All I require are an ancient tarnished plate helmet and three crushed coral pieces. This should be a small task for one such as you. Go now and I shall await your return.");
		elseif(e.message:findi("armplates")) then
			e.self:Say("So, a pair of armplates, is what you require? Well, I require an ancient tarnished plate vambraces as well as three flawed emeralds before you will receive your prize.")
		elseif(e.message:findi("bracers")) then
			e.self:Say("Bracers for the mighty? Retrieve these components and I shall forge the item for you. Bring me an ancient tarnished plate bracelet as well as three crushed flame emeralds.")
		elseif(e.message:findi("gauntlets")) then
			e.self:Say("Mighty gauntlets to smite your foes for the glory of the greater good. It is no easy task but I shall require a pair of an ancient tarnished plate gauntlets and three crushed topaz.")
		elseif(e.message:findi("greaves")) then
			e.self:Say("Sturdy are the pillars that support the temple. I shall make you as strong with these leggings. Gather three flawed sapphires of the sea and a set of ancient tarnished plate greaves.")
		elseif(e.message:findi("boots")) then
			e.self:Say("A pair of boots you shall have once you have gotten a pair of an ancient tarnished plate boots and a set of three crushed pieces of black marble.")
		end
	else
		e.self:Say("You must prove your dedication to Kael Drakkal and the Kromzek clan before I will speak to you.")
	end	
end

function event_trade(e)
	quest_helper:quest_turn_in(e, 1, quest_helper.kael_armor_success) 
end
