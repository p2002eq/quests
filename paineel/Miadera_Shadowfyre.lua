function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ahhhahahaha! The terror that lays over this city like a blanket tingles my bones with vigor. I seek a fellow apostle of Cazic-Thule to assist me in the [summoning of Terror].");
	elseif(e.message:findi("summoning of terror")) then
		e.self:Say("It will be a frightfully fulfilling summons. To do this, I need an eye of urd, some basalt drake scales, the lens of Lord Soptyvr, and a lock of widowmistress hair.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 10523, item2 = 19032, item3 = 14110, item4 = 14109}) and e.other:GetFaction(e.self) < 5) then --Eye of Urd, Basalt Drake Scales, Lens of Lord Soptyvr, Widowmistress Hair
		e.self:Emote("begins speaking an incantation. 'Take this mask as your reward for helping me.'");
		e.other:Faction(143,400,0);
		e.other:Faction(79,-400,0);
		e.other:Faction(112,-400,0);
		e.other:Faction(56,-400,0);
		e.other:Faction(60,-400,0);
		e.other:QuestReward(e.self,math.random(9),math.random(9),math.random(9),math.random(9),14106,5000); --Mundane Mask
		eq.unique_spawn(75195,0,0,421,1182,-37,128); -- spawn avatar of terror
	end
	item_lib.return_items(e.self, e.other, e.trade, false);
	e.self:Say("I require all four reagents, anything less is useless. Incompetence will get you nowhere amongst the faithful of Cazic-Thule!");
end

--END of FILE Zone:paineel  ID:75070 -- Miadera_Shadowfyre
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------