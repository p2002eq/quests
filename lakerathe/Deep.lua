-- Monk Epic 1.0

function event_say(e)
	e.self:Emote("ignores you.");
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 1686}) and e.other:GetLevel() > 45 and e.other:Class() == "Monk") then --Trunt's Head
		e.self:Emote("slowly opens her eyes and looks up at you. She stares at you a long while and then closes her eyes and lowers her head again.");
		e.self:Say("Very well, " .. e.other:GetName() .. ", if you wish death so greatly, we will be happy to oblige. My master projects part of himself in the wilder lands known as the Overthere. He has granted you an audience. Find him and show him the head of our earth brother. At that point, we will discuss how we will end your life.");
		e.other:SummonItem(1686); --Trunt's Head
		eq.set_global("Trunt","1",5,"F");
		e.other:Ding();
		eq.depop_with_timer();
	else
		e.self:Say("I have no use for this, " .. e.other:GetName() .. ".");
		e.other:SummonItem(1686); --Trunt's Head
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
