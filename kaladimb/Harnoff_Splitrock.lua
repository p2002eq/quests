--Quest: Restock High Quality Ore (North Kaladim)

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetins to ya friend Dwarf! I've got some of the finest quality steel ores in all the lands! It's a bit troublesome ta keep a large enough supply of it though, it bein sought after by every smith ya know. If you're needin some cash or ore how bout you [run an errand] fer me?");
	elseif(e.message:findi("errand")) then
		e.self:Say("I was hopin you'd be up fer the job! Take this here crate and fill it with either Small Bricks of Unrefined Ore or Large Bricks of Unrefined Ore and I'll pay ya when ye return.");
		e.other:SummonItem(17814); 	--Empty Ore Crate
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 10952})) then 		--Small Shipment of High Quality Ore
		e.other:Faction(169,5); 	--Kazon Stormhammer
		e.other:Faction(215,5); 	--Merchants of Kaladim
		e.other:Faction(220,-5); 	--Miners Guild 628
		e.other:Faction(219,5); 	--Miners Guild 249
		e.other:Faction(314,5); 	--Storm Guard
		e.other:AddEXP(2000);
		e.other:GiveCash(0,0,0,8); 	--Platinum x 8
		e.other:Ding();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 10953})) then 	--Large Shipment of High Quality Ore
		e.other:Faction(169,5); 	--Kazon Stormhammer
		e.other:Faction(215,5); 	--Merchants of Kaladim
		e.other:Faction(220,-5);	--Miners Guild 628
		e.other:Faction(219,5); 	--Miners Guild 249
		e.other:Faction(314,5); 	--Storm Guard
		e.other:AddEXP(3500);
		e.other:GiveCash(0,0,0,14); --Platinum x 14
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
