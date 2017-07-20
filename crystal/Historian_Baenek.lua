--NPC:	Historian Baenek
--Zone:	crystal (Crystal Caverns)

--Part 3.0 of Spirit of Garzicor Quest:  http://everquest.allakhazam.com/db/quest.html?quest=1277

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.self,e.other);
	
	if (qglobals["garzicor"] == "2") then	--check prequisite flag from Loremaster Sarl in thurgadina
		if(item_lib.check_turn_in(e.trade, {item1 = 18237})) then	--Check for Worn Coldain Tome	
			e.other:Faction(399,10);	--Citizens of Frostone
			e.other:AddEXP(100);
			e.self:Say("You found one of our lost tomes! A lost volume of the Book of Grudges, quite a find. Oh dear Brell! This evidence proves that the legend of Burdael is true! Thank you, " .. e.other:GetName() .. ". And now I suppose you wish to meet his ghostly form. I have sensed him from time to time. I will call to him now. Go and wait for him in the lower halls. His spirit sometimes calls to me from the fearsome Stalag Terrors lair. Be wary though, unlife may have twisted his mind beyond reason.");
			eq.spawn2(121096,0,0,752,-338,-538,0);	--spawns Ghost of Burdael
			eq.set_global("garzicor","3",5,"F"); -- Completed Garzicor Quest Part 3.0
			eq.depop_with_timer();	--depop after hand-in
		end
	end
	item_lib.return_items(e.self, e.other, e.trade);		--standard item return
end
