-- Converted to .lua by Speedz

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18772})) then -- Registration Letter
		e.self:Say("Welcome to Library Mechanimagica. I am Master Magician Wuggan Azusphere. and I will help to teach you the ways of summoning. Here is our guild tunic, make us proud.");
		e.other:SummonItem(13521);	-- Dusty Gold Robe*
		e.other:Ding();
		e.other:Faction(91,100,0); 	-- eldritch collective
		e.other:Faction(71,-15,0); 	-- Dark reflection
		e.other:Faction(322,-5,0);	-- the dead
		e.other:Faction(115,15,0); 	-- gem choppers
		e.other:Faction(176,15,0); 	-- king ak'anon
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
