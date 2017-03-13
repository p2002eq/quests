-- Service_Master_Felouire (202359) in PoK for anniversary quest!

function event_say(e)
	if e.message:findi("hail") then
		e.self:Say("HELLLOOOO!! I'm the lizard on a mission to make Norrath great! It's gonna be HUGE, HUGE I tell you!  But first, I need a rock to roll with it so get me a Chant Rock and we can carry our messages farther. Bring me the blue one, not the green one, not the brown one, the blue one and I will award you this seal.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if item_lib.check_turn_in(e.self, e.trade, {item1 = 12757}) then -- Chant Rock 
		e.self:Say("This is exactly what I needed, Here's the seal as promised.")
		e.other:QuestReward(e.self,0,0,0,0,34045) -- Felouire's Seal
	end
	
	item_lib.return_items(e.self, e.other, e.trade);
end
