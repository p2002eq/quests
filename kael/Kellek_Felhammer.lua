function event_trade(e)
	local item_lib = require('items');
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 25279})) then -- Voucher for Toolset
		e.self:Say("Here you go "..e.other:GetName()..". I dunno why master Wenglawks trusts you with this but take it anyways and don't mess up.");
		e.self:Emote("smacks his fists together as he looks at you.");
		e.other:SummonItem(25104); -- Coldain Toolset
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 =  25280})) then	-- Voucher for Spear
		e.self:Say("Another delivery eh? Be careful with this spear, if you break it I'll break you.");
		e.other:SummonItem(25106); -- Bekeraks New Spear
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 =  25281})) then	-- Voucher for Mechanical Net
		e.self:Say("It's hard to belive a "..e.other:Race().." like you is going to make a trip like this. I don't envy you little fool.");
		e.other:SummonItem(25107); -- Mechanical Net
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 =  1722})) then	-- Helssens Voucher
		e.self:Say("I still cannot believe we are giving such a prized possesion as the Collar of the Storm to a mere mercenary. You better pray you don't bring shame upon the smith who created and enchanted this item. Oh and here is your seal as Helssen has ordered me to give you. It is proof of your service to us.");
		e.other:QuestReward(e.self, 0,0,0,0, 1721, 2000); -- Collar of the storm
		e.other:SummonItem(1723); -- nobles Seal
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
