function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to my store! How may I help you?");
	elseif(e.message:findi("stretching dowels")) then
		e.self:Say("Aye, I have a few left, but they are a big seller right now and I don't know when I'm going to get more in stock. Perhaps we can barter for a set. If you can gather two small owlbear claws and show me your apprentice's cloak, I'll guess that I can justify given you a set of dowels. I'll also be able to make some earrings for my girlfriend. I'm sure she'll love that!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 5580, item2 = 6181, item3 = 6181})) then
		e.self:Say("'These claws are very nice! Don't you think they will make splendid earrings? Of course you do! Well, she'd better like them after all of the trouble I had to go through to get them. Here are your dowels. If you need more, I'll have a new crate of them tomorrow. Take care and enjoy... Thank you for shopping with Jhimis!");
		e.other:SummonItem(5580);
		e.other:QuestReward(e.self,0,0,0,0,6138);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
