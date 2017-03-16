-- Detective_Taian (202345) in PoK for anniversary quest!

function event_say(e)
	if e.message:findi("hail") then
		e.self:Say("Don't think I'm not watching you, from the shadows, waiting... but if you want to get off my radar, you will retrieve a Kerran Doll for me in exchange for my seal. I always wanted one of those dolls.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if item_lib.check_turn_in(e.self, e.trade, {item1 = 13716}) then -- Kerran Doll 
		e.self:Say("Excellent! Here's my seal, but don't tell them I secretly love cats.")
		e.other:QuestReward(e.self,0,0,0,0,34042) -- Taian's Seal
	end
	
	item_lib.return_items(e.self, e.other, e.trade);
end
