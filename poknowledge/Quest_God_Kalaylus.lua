-- Quest_God_Kalaylus (202356) in PoK for anniversary quest!

function event_say(e)
	if e.message:findi("hail") then
		e.self:Say("A lot of quests to fix, so I don't have time to go out and get that Giant Scarab Brain I need for tonight's soup. If you can go find me a fresh one while I keep working, I will give you my seal.  I am sure you will find a way to use it.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if item_lib.check_turn_in(e.self, e.trade, {item1 = 9897}) then -- Giant Scarab Brain   
		e.self:Say("Thanks a ton. Here, take this while I keep working on these.")
		e.other:QuestReward(e.self,0,0,0,0,34048) -- Kalaylus's Seal  
	end
	
	item_lib.return_items(e.self, e.other, e.trade);
end
