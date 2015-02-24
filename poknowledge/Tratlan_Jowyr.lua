--The Magic Pool
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("looks deeply into the pool in front of him, 'Well darn it! I still can't see anything in this blasted [pool], can you Wicas?");
		--Need to trigger Wicas to say: "Nothing at all. Do you think that he led us astray?" right after this.
		eq.signal(202301, 1, 1000);
	elseif(e.message:findi("pool")) then
		e.self:Emote("glances up at you like he just noticed your presence, 'This pool. There is supposed to be strong [magic] in it.'");
	elseif(e.message:findi("magic")) then
		e.self:Say("Scrying magic. These pools can supposedly glance into all of the knowledge past, present, and future.");
		--Need to trigger Wicas to say: "I think we should just do what [Tarerd] wants us to do."
		eq.signal(202301, 2, 1000);
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 15960})) then--The Reflecting Pools of Tanaan
		e.self:Emote("leafs quickly through the book. 'Thank you, it will take quite some time to go through all the information here. Here is a little something for your troubles.'");
		e.other:QuestReward(e.self,0,0,0,0,9321,1485000); --Fine Cut, Diamond Inlaid Mask
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_enter(e)
	eq.signal(202273,5); --Qadar
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
