-- resize crafted armor to small size

function event_say(e)
	fac = e.other:GetFaction(e.self);
	
	if(fac < 6) then
		if(e.message:findi("hail")) then
			e.self:Say("Hail! I am Ranvigoz Tonsmith. My brother Timtok and I are some of the finest smiths this side of Kaladim. If you are interested we will happily [resize] your [Crafted Armor] down to a more manageable size.");
		elseif(e.message:findi("resize")) then
			e.self:Say("I will resize Crafted Bracers, Greaves, a Pauldron or a Breastplate. My brother will resize Crafted Gauntlets, a Vambrace, a Helm or Boots. Just give me the armor and I will resize it for you.");
		elseif(e.message:findi("crafted armor")) then
			e.self:Say("Crafted Armor is made by the Meadowgreen smiths. They can be found in the southern part of the Karanas.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	fac = e.other:GetFaction(e.self);
	item_check = 0;

	if(fac < 6) then
		if(item_lib.check_turn_in(e.trade, {item1 = 4177})) then
			e.other:SummonItem(4185);
			item_check = 1;
		elseif(item_lib.check_turn_in(e.trade, {item1 = 4179})) then
			e.other:SummonItem(4187);
			item_check = 1;
		elseif(item_lib.check_turn_in(e.trade, {item1 = 4175})) then
			e.other:SummonItem(4183);
			item_check = 1;
		elseif(item_lib.check_turn_in(e.trade, {item1 = 4174})) then
			e.other:SummonItem(4182);
			item_check = 1;
		end
		if(item_check == 1) then
			e.self:Say("Here is your armor. I hope it fits better now.");
			e.other:Ding();
			e.other:Faction(47,1,0); -- coalition of tradefolk
			e.other:Faction(184,1,0); -- knights of truth
			e.other:Faction(217,1,0); -- merchants of qeynos
			e.other:Faction(369,1,0); -- coalition of tradefolk iii
		end
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- EOF zone: commons NPC: Ranvigoz_Tonsmith