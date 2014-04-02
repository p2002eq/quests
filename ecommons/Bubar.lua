function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, friend! I am Bubar, merchant from the burning sands. You must be thirsty or, perhaps, hungry. Please look over my goods.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 12351,item2 = 12352,item3 = 12350})) then
		e.self:Say("Mmmph!!.. *Pop!!* Ouch, my thumb!! Here you are. You had a gem inside.");
		e.other:SummonItem(12349);
		e.other:Ding();
		e.other:AddEXP(15000);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
 
 -- ZONE: ecommons -- NAME: Bubar -- ID: 22033