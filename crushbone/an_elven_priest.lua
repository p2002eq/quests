function event_say(e)
	if(e.message:findi("king is dead")) then
		e.self:Say("Dead you say? My goodness! Did you manage to slay the warlord too? If you provide me with proof of his death, I can enchant the mace the dwarf gave you as payment. But, I will require the proof first!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 2301})) then -- Bracers of Battle
		e.self:Say("Erollisi be praised! You slew the orc lord! Well, here is a token of my appreciation! Should you wish to have that mace enchanted, just hand me the mace and my token and I shall uphold my end of the bargain!");
		e.other:QuestReward(e.self,0,0,0,0,1900,5000); -- Prayer Cloth of Tunare
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 6315,item2 = 1900})) then -- Dwarven Mace and Prayer Cloth of Tunare
		e.self:Say("As promised, here is your mace. Let it not fall into dark hands as its power is hidden until combat when it will reveal its true nature. Fare thee well!");
		e.other:QuestReward(e.self,0,0,0,0,6305,10000); -- Screaming Mace
	end
	item_lib.return_items(e.self, e.other, e.trade);
end