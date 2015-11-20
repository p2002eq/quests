--Tundrabear part of 3rd shawl

function event_trade(e)
	local item_lib = require('items');

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1415, item2 = 1425})) then
		e.self:Say("Well I'll be derned. An outlander that can make a good Bearmeat 'n Bread! Thank ye, $name.");
		e.other:Faction(49, 10); --Coldain
		e.other:Faction(67, 10); --Dain
		e.other:Faction(188, -30); --Kromrif
		e.other:Faction(189, -30); --Kromzek
		e.other:SummonItem(1419);
		e.other:AddEXP(50000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1425 })) then	
		e.self:Say("Well I'll be derned. An outlander that can make a good Bearmeat 'n Bread! Thank ye, $name.");
		e.other:Faction(49, 10); --Coldain
		e.other:Faction(67, 10); --Dain
		e.other:Faction(188, -30); --Kromrif
		e.other:Faction(189, -30); --Kromzek
		e.other:AddEXP(5000);
	end
end
