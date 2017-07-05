function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18704) == true) then -- Old Folded Letter
		e.other:Message(15,"A diminutive, but powerful looking gnome stands before you. 'I am Velena Corgtec. The Dark Reflection has called you. Read the note in your inventory and hand it to me when you wish to begin your training. Your destiny awaits!'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18704})) then -- Old Folded Letter
		e.self:Say("A new wizard pledging to our cause is always welcome.");
		e.other:Faction(71,100,0); 	-- Dark reflection
		e.other:Faction(91,-10,0); 	-- eldritch collective
		e.other:Faction(115,-10,0); -- gem choppers
		e.other:Faction(76,-10,0); 	-- Deepmuses
		e.other:QuestReward(e.self,0,0,0,0,13524,100); -- Dark Gold Felt Robe*
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
