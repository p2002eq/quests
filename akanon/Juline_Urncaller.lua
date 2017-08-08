function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18773) == true) then -- Registration Letter
		e.other:Message(15,"A beautiful gnomish woman stands before you. 'Welcome to the Library Mechanimagica young apprentice. I am Juline Urncaller, Master Enchanter. Read the note in your inventory and then hand it to me so that we can begin your training.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18773})) then -- Registration Letter
		e.self:Say("Welcome! I am Juline Urncaller, I will help to guide you on your path to becoming a powerful enchanter.");
		e.other:Faction(91,100,0); 	-- eldritch collective
		e.other:Faction(71,-15,0); 	-- Dark reflection
		e.other:Faction(322,-5,0);	-- the dead
		e.other:Faction(115,15,0); 	-- gem choppers
		e.other:Faction(176,15,0); 	-- king ak'anon
		e.other:QuestReward(e.self,0,0,0,0,13522,100); -- Dirty Gold Felt Robe*
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
