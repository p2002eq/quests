function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail " .. e.other:GetName() .. "! I sell the finest quality ore imported from the mines of Norrath! It's difficult to keep enough ore available with the demands of the local smiths however and could use some [assistance] in restocking my supplies.");
	elseif(e.message:findi("assistance")) then
		e.self:Say("Hooray! Fill this crate with either four small bricks of unrefined ore or four large Bricks of unrefined ore from Norrath and I will pay you for your assistance in keeping me in business.");
		e.other:SummonItem(17814); -- Empty Ore Crate
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10953})) then -- Large Shipment of High Quality Ore
		e.self:Say("Thank you " .. e.other:GetName() .. "! I will prepare the ore for sale and be open for business again momentarily. Here is your payment for your services.");
		e.other:Faction(152, 10); -- House of Fordel
		e.other:Faction(153, 10); -- House of Midst
		e.other:Faction(154, 10); -- House of Stout
		e.other:Faction(338, 10); -- Traders of the Haven
		e.other:QuestReward(e.self,0,0,0,44,0,250); -- Faction, Cash and EXP
		eq.spawn2(151204, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
		eq.depop_with_timer();
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 10952})) then
		e.self:Say("Thank you " .. e.other:GetName() .. "! I will prepare the ore for sale and be open for business again momentarily. Here is your payment for your services.");
		e.other:Ding();
		e.other:Faction(152, 10); -- House of Fordel
		e.other:Faction(153, 10); -- House of Midst
		e.other:Faction(154, 10); -- House of Stout
		e.other:Faction(338, 10); -- Traders of the Haven
		e.other:AddEXP(250);
		e.other:GiveCash(0, 0, 0, 14);
		--eq.spawn2(151057, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- TODO Add additional NPC with same logic and shout/despawn timers.
		eq.depop_with_timer();
		e.other:QuestReward(e.self,0,0,0,0,item,exp); --
	end
	item_lib.return_items(e.self, e.other, e.trade)
end