--part of the 3rd shawl

function event_trade(e)
	local item_lib = require('items');

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1416, item2 = 1426})) then
		e.self:Say("Why thank you, "..e.other:GetName()..", I haven't tasted snow bunny stew this good in quite some time. Be a dear and take this back to Mordin for me.");
		e.other:SummonItem(1423);
		e.other:AddEXP(100000);
		e.other:Faction(49, 10); --coldain
		e.other:Faction(67,10); --dain
		e.other:Faction(188,-30); --kromrif
		e.other:Faction(189,-30); --kromzek
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1426 })) then	
		e.self:Say("Thanks for the Snow Bunny Stew, "..e.other:GetName()..".");
		e.other:AddEXP(5000);
		e.other:Faction(49, 10); --coldain
		e.other:Faction(67,10); --dain
		e.other:Faction(188,-30); --kromrif
		e.other:Faction(189,-30); --kromzek
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
