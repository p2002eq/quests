function event_say(e)
	if (e.message:findi("hail")) and (e.other:GetFaction(e.self) < 6) then	
		e.self:Say("What is it you want, " .. e.other:Race() .. "?  I have no time to speak with your kind.");
	end
end

function event_trade(e)
	local item_lib = require('items');
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 25266})) then -- Giant Sack of Supplies
		e.self:Say("Thank you for bringing the supplies, $name. This season has not treated my clan well.  The winds have grown colder and the Coldain are now brazen enough to hunt the same animals we do.  Take this torque back to Svekk and he will repay you for the supplies.");
		e.other:QuestReward(e.self,0,0,0,0,25275,250); -- Velium Torque
		e.other:Faction(189,10); -- kromzek
		e.other:Faction(188,10); -- kromrif
		e.other:Faction(49,-30); -- Coldain
		e.other:Faction(42,-30); -- CoV
	end
	item_lib.return_items(e.self, e.other, e.trade);
end