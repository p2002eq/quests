-- resize crafted armor to small size
function event_say(e)
	fac = e.other:GetFaction(e.self);
	if(fac < 6) then
		if(e.message:findi("hail")) then
			e.self:Say("Hail! I am Timtok Tonsmith. My brother Ranvigoz and I are some of the finest smiths this side of Kaladim. If you are interested we will happily [" .. eq.say_link("resize") .. "] your [" .. eq.say_link("Crafted Armor") .. "] down to a more manageable size.");
		elseif(e.message:findi("resize")) then
			e.self:Say("I will resize Crafted Gauntlets, a Vambrace, a Helm or Boots. My brother will resize Crafted Bracers, Greaves, a Pauldrun or a Breastplate. Just give me the armor and I will resize it for you.");
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
		if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4178})) then -- Crafted Gauntlets
			e.other:SummonItem(4186); -- Small Crafted Gauntlets
			item_check = 1;
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4176})) then -- Crafted Vambraces
			e.other:SummonItem(4184); -- Small Crafted Vambraces
			item_check = 1;
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4173})) then -- Crafted Helm
			e.other:SummonItem(4181); -- Small Crafted Helm
			item_check = 1;
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4180})) then -- Crafted Plate Boots
			e.other:SummonItem(4188); -- Small Crafted Plate Boots
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