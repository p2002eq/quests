function event_say(e)
    if(e.message:findi("missing helmet")) then
        e.self:Say("Recently helmets have been stolen from our workers.  One of them reported seeing one of those wreched flying monkey beasts carry one off.  Having those helmets back would be very useful.  If you come across any of the workers helmets, return them to me and I will bestow a reward totem upon you.");
end

function event_trade(e)
    if((e.other:GetFaction(e.self)<6) and item_lib.check_turn_in(e.self, e.trade, {item1 = 25266})) then -- Giant Sack of Supplies
		e.other:Faction(189,10); --# Kromzek
		e.other:Faction(188,10); --# Kromrif
		e.other:Faction(49,-30); --# Coldain
		e.other:Faction(42,-30); --# Claws of Veeshan
		e.other:QuestReward(e.self,0,0,0,0,0,250); -- 
	end

	item_lib.return_items(e.self, e.other, e.trade)
end