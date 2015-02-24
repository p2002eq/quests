function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail. and welcome to Stormguard Hall. home to all great warriors! Are you also a [warrior of the Stormguard] or do you [follow another guild]?");
	elseif(e.message:findi("i am a warrior of the stormguard")) then
		e.self:Say("As I thought. You do not appear to be one who relies on wits rather than brawn. no offense. I have word that a Stormguard on duty has deserted his post at one of the guardposts in the Butcherblocks. I want you to go and seek him out. He is Guard Bundin. Return his Stormguard axe to me. along with his head. There shall be no cowards in the Stormguard!!");
	elseif(e.message:findi("i follow another guild")) then
		e.self:Say("Then go to your guild. This is the hall of the dwarven warriors - not a place for common folk to lounge around.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 12156, item2 = 5014})) then
		e.self:Say("Well Done!");
		e.other:SummonItem(eq.ChooseRandom(5027,5034,6019,6024,7013));
		e.other:Faction(169,5);
		e.other:Faction(314,5);
		e.other:Faction(219,5);
		e.other:Faction(419,5);
		e.other:Faction(57,-5);
		e.other:AddEXP(5000);
		e.other:GiveCash(3,6,10,0);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
