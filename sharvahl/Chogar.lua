function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello. Would you care to dabble in the art of ceramics? My prices are quite fair. Feel free to make use of my pottery wheel if you would like to try your hand in the art.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 5955})) then --Vase Pieces
		e.self:Say("I can do nothing to repair this mess, but a skilled potter like you should be able to create a new one with little trouble. One second please. I'll jot a rough sketch of what I surmise the original looked like when it was intact. You can take the sketch and make a new one. It will require of you a medium sized block of clay, a little water, and this sketch. Here you go. The sketch is a little crude, but I am sure that it will suffice. Fire it with a quality firing sheet and give the resulting product to Gawfed. Jihli told me that he was eager to receive it.");
		e.other:QuestReward(e.self,0,0,0,0,5956); --Rough Vase Sketch
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
