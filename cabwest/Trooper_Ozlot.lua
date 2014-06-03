function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, citizen! If it is a good time you are seeking, you should head toward the tavern. You can't miss it. There is only one. The emperor says we should spend most of our time training, not in revelry. We troopers try.");
	elseif(e.message:findi("sign the restraining order")) then
		e.self:Say("I do not believe you were sent by the legion. You do not look as though you could squash a kitten or even a bug. If you truly were sent, then you should be able to hunt down a sabertooth kitten. Tell you what, you bring me two sabertooth kitten canines and the legion order and I shall believe you. Only then will I sign the order for you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18246, item2 = 12670, item3 = 12670})) then --Legion Order (6 signed), Sabertooth Kitten Canine x 2
		e.self:Say("I suppose you were sent by the legion. I will sign. Here is the legion order back. Now, leave, so I can finish my watch.");
		e.other:SummonItem(18247); 	--Legion Order (7 signed)
		e.other:Faction(193,5); 	--Legion of Cabilis
		e.other:Faction(30,5); 		--Cabilis Residents
		e.other:Faction(282,5); 	--Scaled Mystics
		e.other:Faction(62,5); 		--Crusaders of Greenmist
		e.other:Faction(317,5); 	--Swift Tails
		e.other:AddEXP(800);
		e.other:Ding();
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 12670, item2 = 12670})) then
		e.self:Say("I told you that I need two sabertooth kitten canines and the legion order.");
		e.other:SummonItem(12670);
		e.other:SummonItem(12670);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 18246, item2 = 12670})) then
		e.self:Say("I told you that I need two sabertooth kitten canines and the legion order.");
		e.other:SummonItem(18246);
		e.other:SummonItem(12670);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 18246})) then
		e.self:Say("I told you that I need two sabertooth kitten canines and the legion order.");
		e.other:SummonItem(18246);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
