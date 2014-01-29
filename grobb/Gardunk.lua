-- Converted to .lua by Speedz

function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.trade, {item1 = 18845})) then -- A tattered note
		e.self:Say("You fight like alligator and tear enemy limb from limb!  Wear tunic that smell of swamp an devour enemy wit brodder Dark Ones!  You go see Gargh now, he got work for you!");
		e.other:SummonItem(13576);	-- Molding Tunic
		e.other:Ding();
		e.other:Faction(70,5,0);	-- Dark Ones
		e.other:Faction(292,5,0);	-- Shadowknights of Night Keep
		e.other:Faction(106,-10,0); -- Frogloks of Guk
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
