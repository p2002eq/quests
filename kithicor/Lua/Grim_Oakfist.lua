------------------------------------------------------------------------------------
-- ZONE: Kithicore Forest (kithicor)
-- DATABASE: PEQ-PoP
-- LAST EDIT DATE: October 17, 2009
-- VERSION: 1.0
-- DEVELOPER: Congdar
--
-- *** NPC INFORMATION ***
--
-- NAME: Grim_Oakfist
-- ID: 20220
-- TYPE: Monk
-- RACE: Human
-- LEVEL: 30
--
-- *** ITEMS GIVEN OR TAKEN ***
--
-- Unusual Tiger Pelt ID-12341
-- Peculiar Tiger Pelt ID-12342
-- Strange Tiger Pelt ID-12343
--
-- *** QUESTS INVOLVED IN ***
--
-- Grim's Tiger Revenge
-- Treant Fists
--
-- *** QUESTS AVAILABE TO ***
--
-- Monks with good Ashen Order Faction
--
------------------------------------------------------------------------------------------

function event_say(e)
	-- [FLAG: Possible incorrect client target: e.self:Class() ==] if((e.other:GetFaction(e.self) < 4)and(e.self:Class() == "Monk")) then
		if(e.message:findi("Hail")) then
			e.self:Say("It is good to finally meet one who respects the disciplines of the Ashen Order.  All I have met are rangers.  They have interfered with my [mission in the woods].");
		end
		if(e.message:findi("mission in the woods")) then
			e.self:Say("I have come here to avenge my family.  One season past, they were attacked by a trio of deadly tigers.  I came here to hunt the beasts down, but then I found the local rangers and residents here protect the tigers.  They seem to be legends in these parts.  The tigers even have name's!!  They call them Eenot, Reggit and Kobb.  I wish I had help from a [fellow monk].");
		end
		if(e.message:findi("fellow monk")) then
			e.self:Say("Good!! The rangers are watching me so you must go alone.  I can only wait until the morning, then I must go.  If you find all three tigers, return their pelts to me and I shall reward you with something discovered for monks only.");
			-- Spawn Eenot
			eq.unique_spawn(20276, 4, 0, 1499.47, -22.75, 168.35);
			-- Spawn Reggit
			eq.unique_spawn(20277, 5, 0, 3063, 1636, 363);
			-- Spawn Kobb
			eq.unique_spawn(20278, 6, 0, 3741.9, 256.5, 496.2);
		end
		if(e.message:findi("treant fists")) then
			e.self:Say("The treant fists were created by great craftsmen.  They are for the fists of a monk and offer greater dexterity and increase the durability of one's soul.  My last pair were given to Master Puab of the Ashen House training grounds.");
			eq.depop_with_timer();
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 12341, item2 = 12342, item3 = 12343})) then
		
		e.self:Say("Good work.  I hope you had no run ins with the local rangers.  Here is my reward.  An object from the past which I found in my journeys.  Wish that I could reward you also with [treant fists].");
		-- Collar of Neshika ID-12367
		e.other:SummonItem("12367");
		e.other:AddEXP("100");
		e.other:Ding();
		-- Ashen Order Faction ID-12
		e.other:Faction("12","10");
		-- Knights of Truth Faction ID-184
		e.other:Faction("184","10");
		-- Silent Fist Clan Faction ID-300
		e.other:Faction("300","10");
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
--END of FILE Zone:kithicor ID:20220 -- Grim_Oakfist



-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
