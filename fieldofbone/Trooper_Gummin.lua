function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Beware the bone field beyond the path. It is said that the bones of a thousand fallen warriors walk its grounds at night.");
	elseif(e.message:findi("sign the restraining order")) then
		e.self:Say("Blast! The masters have condemned me to a life of sobriety and bloodshed! At least I still have bloodshed. But I would like one last drink. I would like a bottle of Legion Lager from Cabilis. Bring me the lager and the legion order and then I shall sign it.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18242, item2 = 12463})) then --Legion Order (2 signed), Legion Lager
		e.self:Emote("slowly signs the order. '...Love, Innoruuk. There you go. Now run along. Let me enjoy my last brew alone.'");
		e.other:Faction(193,5); --Legion of Cabilis
		e.other:Faction(30,5); --Cabilis Residents
		e.other:Faction(282,5); --Scaled Mystics
		e.other:Faction(62,5); --Crusaders of Greenmist
		e.other:Faction(317,5); --Swift Tails
		e.other:QuestReward(e.self,0,0,0,0,18243,500); --Legion Order (3 signed)
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 18242, item2 = 18242})) then
		e.self:Say("What?! I need the Legion Lager and the legion order.");
		e.other:SummonItem(18242);
		e.other:SummonItem(18242);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 12463, item2 = 12463})) then
		e.self:Say("What?! I need the Legion Lager and the legion order.");
		e.other:SummonItem(12463);
		e.other:SummonItem(12463);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 12463})) then
		e.self:Say("What?! I need the Legion Lager and the legion order.");
		e.other:SummonItem(12463);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 18242})) then
		e.self:Say("What?! I need the Legion Lager and the legion order.");
		e.other:SummonItem(18242);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
