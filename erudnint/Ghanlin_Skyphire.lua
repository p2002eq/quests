function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18727})) then -- Tattered Note
		e.self:Say("Greetings. I am Ghanlin Skyphire, Master Wizard of the Crimson Hands. All of us here have devoted our lives to the studies of the arcane and mystical. Let's get you started. Here's your training robe.  Now, go find Raskena. She'll help train you and give you your first lesson.");
		e.other:SummonItem(13550); --Old Used Robe*
		e.other:Ding();
		e.other:Faction(60,10,0);   --Crimson Hands
		e.other:Faction(145,10,0);  --High Council of Erudin
		e.other:Faction(143,-15,0); --Heretics
		e.other:Faction(147,10,0);  --High Guard of Erudin		
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

--END of FILE Zone:erudnint  ID:24040 -- Ghanlin_Skyphire