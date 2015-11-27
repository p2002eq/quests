function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Busy, busy, busy. Must get all these tools sharpened before the miners get cranky.");
	elseif(e.message:findi("stonetooth sent me")) then	
		e.self:Say("You spoke with old Stonetooth? Eeegads man! No one talks to 'im. Legend says he spent so much time down there that he eats nothin' but rocks now and drinks melted velium. Well I guess I should sharpen his axe, but I'll need some velium ore to repair it some. Bring me a chunk o' Velium Ore along with his axe and I'll get to work.");
	end
end

function event_trade(e)
	local item_lib = require('items');

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1690, item2 = 22569})) then
		e.self:Say("Excellent! I'll get ta work now. Hakon whistles an unfamiliar tune as he repairs and sharpens the pick axe. Here ye are, "..e.other:GetName()..". Watch that old Stonetooth, he's a few steins short of a keg, if ye know what I mean.");
		e.other:Faction(49, 5); --Coldain
		e.other:Faction(67, 5); --Dain
		e.other:Faction(189, -10); --Kromzek
		e.other:Faction(188, -10); --Kromrif
		e.other:QuestReward(e.self, 0,0,0,0,1691,0); --Norman's axe of damage v2
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
