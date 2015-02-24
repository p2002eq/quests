function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to our camp.  We are paladins gathered from many lands. We have been called to this land by our deities.  Ours is a crusade of righteousness.  Have you happened upon us by chance or do you [seek the sacred molds]?");
	elseif(e.message:findi("helm of ro")) then
			e.self:Say("To receive the mold of the Helm of Ro you must first demonstrate your strength.  Go to the plains of thunder.  There you shall hunt down the most vile creatures I have ever encountered.  Seek the undead cyclopes.  I have spied them in the most dangerous portions of my realm. Fetch me two of their skulls.");
	elseif(e.message:findi("seek the sacred molds")) then
		e.self:Say("Many of us carry the sacred molds of the holy paladin armor.  We will release it only to those who have proven themselves to each of our deities.  If you seek it, speak up!! Tell us which part you seek.  I carry the secret of the [Helm of Ro].  The others carry those of vambraces, breastplates, bracers, gauntlets, greaves and boots of Ro.");
	elseif(e.message:findi("Lord Searfire")) then
		e.self:Say("Lord Searfire is a great forge master.  He was called forth to the land of fire lakes.  It is said that he now toils in the name of Solusek Ro within a hidden temple of that land.  He and he alone knows how to obtain [ronium], a needed component for forging the sacred Armor of Ro.");
	elseif(e.message:findi("ronium")) then
		e.self:Say("It is an alloy created from two rare metals.  Only [Lord Searfire] knows the formula.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFaction(e.self) < 5) then  -- amiable or better to get mold
		if(item_lib.check_turn_in(e.trade, {item1 = 12308, item2 = 12308})) then
			e.self:Say("You have proven yourself to Karana.  I grant you the mold of the Ro Helm.  May the winds of Karana blow in your favor.  Now you must seek out [Lord Searfire] and  ask him for [ronium] to complete the second and only other component needed to be fashioned by a master blacksmith.");
			e.other:Faction(183,2); --Knights of Thunder
			e.other:Faction(21,-3); --Bloodsabers
			e.other:Faction(257,3); --Priests of Life
			e.other:Faction(135,2); --Guards of Qeynos
			e.other:QuestReward(e.self,0,0,0,0,12298);
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
	
--END of FILE Zone:rathemtn  ID:50112 -- Thomas
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------