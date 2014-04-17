function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Welcome, %s.  Please feel at ease here in the Temple of Thunder.  We, the Knights of Thunder, are here to guide and serve.",e.other:GetName()));
	end
end

function event_trade(e)
	local item_lib =require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 18715})) then -- Tattered Note
		e.self:Say("Welcome, friend, to the Temple of Thunder. Here, you can practice your skills and learn the ways of Karana. Take this tunic and wear it with pride, for you are now a Priest of Thunder. Guild Trainer Daedet Losaren will begin your tutoring, see him when you are ready.");
		e.other:SummonItem(13505); -- Old Gray Tunic*
		e.other:Ding();
		e.other:Faction(183,100,0); -- Knight of Thunder
		e.other:Faction(21,-100,0); -- Bloodsabers
		e.other:Faction(257,75,0); -- Priest of Life
		e.other:Faction(135,75,0); -- Guards of Qeynos
		e.other:AddEXP(100);
	end
	
	item_lib.return_items(e.self, e.other, e.trade)
end
