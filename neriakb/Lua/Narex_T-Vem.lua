--Narex_T-Vem.pl
--Fire Goblin Runner/Halfling Raider Helms

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome to the Cauldron of Hate. If you are a young warrior, you have come to the right place. There are many [duties] to be performed. If you are a veteran of the blade, we welcome your return to service. Perhaps you return with a [Leatherfoot] skullcap?");
	end
	if(e.message:findi("duties")) then
		e.self:Say("I am so glad you asked. There is one matter of importance with which you may be able to assist. It seems an Erudite has made camp in Lavastorm. He is powerful and we do not expect you to slay him. Your mission is to cut off his supply line. I hope you will [accept the mission].");
	end
	if(e.message:findi("accept the mission")) then
		e.self:Say("Go to the Lavastorm Mountain Range. It is a dangerous place, but the one you seek must leave by the direction you entered. He is a goblin. Apparently the Erudite is employing their strength. The fire goblin runner shall be an easy kill for you. At least, he should be. Return his runner pouch to me.");
	end
	if(e.message:findi("leatherfoot")) then
		-- [FLAG: Possible incorrect client target: e.self:Class() ==] if(e.self:Class() == "Warrior") then
			e.self:Say("Where have you been? The halflings of Rivervale have an elite force of warriors. They are called the Leatherfoot Raiders. They have been infiltrating our glorious city of Neriak for quite some time. They must be exterminated! I must hire strong warriors who wish to [collect the bounty].");
		
		else
			e.self:Say("Go!! Return when you have done more to serve the Indigo Brotherhood of Neriak. Fewer Leatherfoot Raiders in Nektulos and a few Leatherfoot skullcaps in the palms of Master Narex shall prove your true warrior nature and loyalty to our house.");
		end
	end
	if(e.message:findi("collect the bounty")) then
		e.self:Say("So you wish to collect the bounty on Leatherfoot Raiders? Then go into Nektulos and hunt them down. I shall pay a reward for no fewer than four Leatherfoot Raider skullcaps.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 13886})) then --Goblin Supply Pouch
		e.self:Say("Fine work. I trust the denizens of Lavastorm were not unkind. Please take this featherweight pouch as a reward. May it keep you fleet of foot.");
		e.other:SummonItem(17972); --Featherweight Pouch
		e.other:Faction(155, 2); --Indigo Brotherhood
		e.other:Faction(92,-5); --Emerald Warriors
		e.other:Faction(311,-5); --Steel Warriors
		e.other:Faction(260,-5); --Primordial Malice
		e.other:AddEXP(17150);--5% of level 8 experience, quest is for levels 8+
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 13113, item2 = 13113, item3 = 13113, item4 = 13113})) then --Leatherfoot Raider Skullcap
		e.self:Say("Yes, you have done well. Take this, and slay more!"); --text made up
		e.other:SummonItem(12257);--Footman's Voulge
		e.other:GiveCash(0,0,4,0);--4gp
		e.other:Faction(155, 2); --Indigo Brotherhood
		e.other:Faction(92,-5); --Emerald Warriors
		e.other:Faction(311,-5); --Steel Warriors
		e.other:Faction(260,-5); --Primordial Malice
		e.other:AddEXP(250);--5% of level 2 experience, quest is for levels 2+
	end
	
	item_lib.return_items(e.self, e.other, e.trade)
end
--END of FILE Zone:neriakb  ID:41032 -- Narex_T-Vem

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
