function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings " .. e.other:GetName() .. ". Lately the creatures of Lake of Ill Omen have be causing problems for us. Are you [interested] in helping me reduce the threat from this creatures?");
	elseif(e.message:findi("interested")) then
		e.self:Say("Good. Bring me a Brittle Iksar Skull, a Sabertooth Cub Canine, and a Large Scorpion Pincer. And i shall reward you with a spell.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	spellnum = eq.ChooseRandom(15338,15344,15339,15340,15225,15229,15346,15491,15502,15341,15342,15347,15348,15331,15221,15343); --I am not 100 percent sure on this spells list. It is simply everything he sells I gathered from the information available that this is correct.
	if(item_lib.check_turn_in(e.trade, {item1 = 12739, item2 = 12659, item3 = 12426})) then
		e.self:Say("Good Work " .. e.other:GetName() .. ". This will surely hold back those vile creatures for some time. Here is your spell.");
		e.other:SummonItem(spellnum);
		e.other:AddEXP(10);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--Dialogue is made up since I was not able to find the correct dialogue on Alla's
--By Kovou
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
