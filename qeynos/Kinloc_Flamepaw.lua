function event_trade(e)
	local item_lib =require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18719})) then -- Tattered Note
		e.self:Say("Welcome to the Order of Three. I am Kinloc, Guild Master of the Magicians. This tunic of the Order is for you, wear it with honour. Study hard and master your skills, and you will become an important part of our Order. Yestura shall help introduce you to the ways of magic.");
		e.other:SummonItem(13543); -- Used Blue Robe*
		e.other:Ding();
		e.other:Faction(240,100,0); -- Order of Three
		e.other:Faction(21,-25,0); -- Bloodsabers
		e.other:Faction(135,15,0); -- Guards of Qeynos
		e.other:Faction(235,-15,0); -- Opal Dark Briar
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
