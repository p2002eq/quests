function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("look's upon you smugly.");
		e.self:Say("And what are you, some sort of adventurer? Bah!! You will be shaken by the first undead you come across. Wetting your pant's you shall be. Ha Ha!! I doubt you could even [kill the decaying skeletons]!");
	elseif(e.message:findi("kill the decaying skeletons")) then --Bone Chips (fieldofbone)(START)
		e.self:Say("You kill skeletons?!! I think not!! They will bounce you with no trouble at all. Ten silvers says you cannot collect four bone chips!! When Velious melts!! Hah!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 13073, item2 = 13073, item3 = 13073, item4 = 13073})) then --Handin: 4x Bone chips
		e.self:Emote("gasp's in astonishment.");
		e.self:Say("Wha...? This!! But... I... Why you... I oughta.. All right!! A bet is a bet. Here you go. A few silver piece's for your achievement. What?!! You thought I would give you ten? Fat chance! Now get lost or I will haul you in for impersonating a froglok.");
		e.other:Faction(193,15); -- +Legion of Cabilis
		e.other:Faction(30,15);  -- +Cabilis Residents
		e.other:Faction(282,15); -- +Scaled Mystics
		e.other:Faction(62,15);  -- +Crusaders of Greenmist
		e.other:Faction(317,15); -- +Swifttails
		e.other:QuestReward(e.self,0,eq.ChooseRandom(1,2,3,4,5,6,7),0,0,18243,500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
