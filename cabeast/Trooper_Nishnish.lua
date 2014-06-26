function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, citizen! Keep clear of the waterways which run through this grand city. For swimming they are not. Many times have playful broodlings fallen prey to the sharp teeth of barracudas.");
	elseif(e.message:findi("sign")) then
		e.self:Say("So the legion has sent you to have me sign this order, eh? Nay. I shall not do so unless the messenger, you, gathers two barracuda teeth for me. Hand me the legion order when you hand me the two barracuda teeth and then your task shall be complete.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18244, item2 = 12465, item3 = 12465})) then --Legion Order (4 signed), Barracuda Tooth x 2
		e.self:Emote("grabs the barracuda teeth and attaches them to a necklace. 'Good. Now this barracuda charm shall keep me safe from slipping into the waters and becoming a feast for the barracuda. And you, take this legion order and be gone.'");
		e.other:SummonItem(18245);	--Legion Order (5 signed)
		e.other:Faction(193,5); 	--Legion of Cabilis
		e.other:Faction(30,5); 		--Cabilis Residents
		e.other:Faction(282,5); 	--Scaled Mystics
		e.other:Faction(62,5); 		--Crusaders of Greenmist
		e.other:Faction(317,5); 	--Swift Tails
		e.other:AddEXP(800);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 12465, item2 = 12465})) then
		e.self:Say("You shall get my signature when I have the legion order and two barracuda teeth.");
		e.other:SummonItem(12465,2);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 12465, item2 = 18244})) then
		e.self:Say("You shall get my signature when I have the legion order and two barracuda teeth.");
		e.other:SummonItem(12465,1);
		e.other:SummonItem(18244);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 12465})) then
		e.self:Say("You shall get my signature when I have the legion order and two barracuda teeth.");
		e.other:SummonItem(12465);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18244})) then
		e.self:Say("You shall get my signature when I have the legion order and two barracuda teeth.");
		e.other:SummonItem(18244);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
