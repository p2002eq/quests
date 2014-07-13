--------------------------
--Quest Name: Murder of Hurrietta
--Author: ?? (Update by BWStripes)
--NPC's Involved: 1
--Items involved: 6
--------------------------
------NPC 1
--Name: Garuc_Anehm
--Race 1 (Human), Texture of 3, Size 0, gender of 0
--Location XYZ: -655.0, 357.0, -35.0 in Qeynos Catacombs
--Level: 61
--Type: SK GM
----
--Reward Item: 1-5
--Name: Random Patchwork armor
--ID: 2104, 2106, 2108, 2111, 2112
------
-- Item 6
-- Name: Rat Shaped Ring
-- ID: 13301
-- Quest Item
--------------------------
------Item
--Name: Hurrieta's Bloody Dress
--ID: 13134
------

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome to the Shrine of Bertoxxulous! You appear to be [new to the shrine]. I do not remember seeing you around.");
	end
	if(e.message:findi("new to the shrine")) then
		e.self:Say("New blood to spread Bertoxxulous' disease? We presently need the help of a [young shadowknight]. There are certain deeds which must be carried out.");
	end
	if(e.message:findi("young shadowknight")) then
		e.self:Say("Then let your supreme task be the extermination of the Priests of Life. Know that they threaten the will of our Lord Bertoxxulous. For every fallen paladin and cleric of the Temple of Life. you shall rise within our ranks.  So... do you [loathe paladins]?");
	end
	if(e.message:findi("loathe paladins.")) then
		e.self:Say("As do we all. The paladins of Qeynos come from either the Hall of Thunder or the Temple of Life. We have put a bounty upon their heads. Destroy these knights and return either the Order of Thunder or the prayer beads of these inferior men. There has even been a report from [Commander Kane].");
	end
	if(e.message:findi("commander kane")) then
		e.self:Say("Kane Bayle is the Commander of the Qeynos Guard. He has found it advantageous to befriend the Bloodsabers. We share a [common goal]. He assists us in many ways. He has some new information to reveal.  Go and tell him you are a Bloodsaber. Do not speak with him while he is on duty!!");
	end
	if(e.message:findi("common goal")) then
		e.self:Say("Kane Bayle and the leaders of this shrine all wish to overthrow the rule of Antonius Bayle. He, for power, and we for the glory of Bertoxxulous. From this city, our diseased lord shall appear and tread across the land spitting death from his mouth and deforming the land. His glory shall be eternal!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 13134})) then
		local garuc_reward = eq.ChooseRandom(2104, 2106, 2108, 2111, 2112, 13301);--Updated to issue random patchwork armor, or a rat-shaped ring
		local garuc_randomSP = int(rand(20));
		local garuc_randomCP = int(rand(20));
		e.self:Say("Hahaha.. I see you actually killed a respected, well-known citizen of Qeynos. No loss for them, but you are certainly a gain for our shrine. Maybe this shall do you some good. If not now, then surely later. You may need it when the Qeynos Guards hunt you down.");
		e.other:SummonItem(garuc_reward);
		e.other:GiveCash(garuc_randomCP,garuc_randomSP,0,0);-- Random from 20cp20sp
		e.other:Faction(135,-5); --Guards of Qeynos
		e.other:Faction(257,-5); --Priests of Life
		e.other:Faction(183,-5); --Knights of Thunder
		e.other:Faction(21,3);   --Bloodsabers
		e.other:AddEXP(500);
	end
	--do all other handins first with plugin, then let it do disciplines
	
	item_lib.return_items(e.self, e.other, e.trade)
end
--END of FILE Zone:qcat  ID:45070 -- Garuc_Anehm

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
