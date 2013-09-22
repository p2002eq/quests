function event_trade(e)

	local item_lib =require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 18718})) then -- Tattered Note
		e.self:Say("Greetings, I am Gahlith, Master of the Wizard's Order of the Hall of Sorcery. Here, we have devoted our lives and souls to the study of the arcane. My apprentice Kazlo Naedra shall tutor you and teach you the fundamentals of sorcery.");
		e.other:SummonItem(13508); -- Blue Training Robe*
		e.other:Ding();
		e.other:Faction(240,10,0); -- Order of Three
		e.other:Faction(21,-15,0); -- Bloodsabers
		e.other:Faction(135,10,0); -- Guards of Qeynos
		e.other:Faction(235,-15,0); -- Opal Dark Briar
		e.other:AddEXP(100);
	end
	
	item_lib.return_items(e.self, e.other, e.trade)
	
end
