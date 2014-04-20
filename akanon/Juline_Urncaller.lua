-- Converted to .lua by Speedz

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18773})) then -- Registration Letter
		e.self:Say("Welcome! I am Juline Urncaller, I will help to guide you on your path to becoming a powerful enchanter.");
		e.other:SummonItem(13522); 	-- Dirty Gold Felt Robe*
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
