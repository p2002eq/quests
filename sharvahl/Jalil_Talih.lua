function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Oh, hello there " .. e.other:GetName() .. ". Thank you for stopping by, but this is just not a very good time for visitors. My daughter is very upset over what has happened.");
	elseif(e.message:findi("happened")) then
		e.self:Say("Oh my, I thought everyone had heard by now. Behari has gone missing. Been quite some time now, in fact. Even the king had gotten involved in the search for him, but...");
		e.self:Emote("lowers his voice to a whisper so as not to upset his daughter.");
		e.self:Say("Everyone has about given up hope. Soroush was the last we know of that had seen him, but he had very little helpful information.");
	elseif(e.message:findi("soroush")) then
		e.self:Say("Soroush has taken over Behari's duties... temporarily, at least. He can usually be found right in the throne room in case he is needed.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 5996})) then
		e.self:Say("Ah this was my wife Aisha's locket. She had given it to Kalila. Thanks so much for returning it. Here take this belt as my thanks.");
		e.other:QuestReward(e.self,0,0,0,0,5995);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
