local items = {}

function items.check_turn_in(npc, trade, trade_check, keepitems)
	--create trade_return table == trade
	--shallow copy
	local trade_return = {};
	for key, value in pairs(trade) do
		trade_return[key] = value;
	end

	--for every item in trade_check check trade_return
		--if item exists in trade_return then
			--remove that item from trade_return
		--else
			--failure
			
	if(keepitems) then
		-- Add all the items handed to us to the NPC's loottable
		for a = 1, 4 do
			local add = trade_return["item" .. a];
			if(add.valid) then
				npc:AddQuestLoot(add:GetID());
			end
		end
	end
	
	--Main loops. First loop iterates though the quest items (item1, item2, etc.) The second loop iterates
	--through the items handed to the NPC, comapring them to the item in the first loop.
	for i = 1, 4 do
		local key = "item" .. i;
		if(trade_check[key] ~= nil and trade_check[key] ~= 0) then
			local found = false;
			for j = 1, 4 do
				-- This compares the items handed to the NPC with what is specified in the quest.
				local inst = trade_return["item" .. j];
				if(inst.valid and trade_check[key] == inst:GetID()) then
					if(not keepitems) then
						trade_return["item" .. j] = ItemInst();
					end
					found = true;
					break;
				end
			end

			if(not found) then
				if(keepitems) then 
					-- This compares the items in the NPC's loottable with what is specified in the quest.
					local hasitem = npc:GetQuestLoot(trade_check[key]);
					if(hasitem) then
						found = true;											
					else
						trade.item1 = 0;
						trade.item2 = 0;
						trade.item3 = 0;
						trade.item4 = 0;
						return false;
					end
				else
					return false;
				end
			end
		end
	end
	
	-- Setup clean variables for count check and delete.
	local item1 = trade_check["item1"];
	local item2 = trade_check["item2"];
	local item3 = trade_check["item3"];
	local item4 = trade_check["item4"];
	if(trade_check["item1"] == nil) then
		item1 = 0;
	end
	if(trade_check["item2"] == nil) then
		item2 = 0;
	end
	if(trade_check["item3"] == nil) then
		item3 = 0;
	end
	if(trade_check["item4"] == nil) then
		item4 = 0;
	end
		
	if(keepitems) then
		-- If the quest requires multiple of the same item, this counts up the NPC's loottable items for us.
		local count = npc:QuestLootCount(item1, item2, item3, item4);
		if(not count) then
			trade.item1 = 0;
			trade.item2 = 0;
			trade.item3 = 0;
			trade.item4 = 0;
			return false;
		end
	end
	
	--convert our money into copper then check that we have enough then convert change back
	local trade_check_money = 0;
	local return_money = 0;

	if(trade_check["platinum"] ~= nil and trade_check["platinum"] ~= 0) then
		trade_check_money = trade_check_money + (trade_check["platinum"] * 1000);
	end

	if(trade_check["gold"] ~= nil and trade_check["gold"] ~= 0) then
		trade_check_money = trade_check_money + (trade_check["gold"] * 100);
	end

	if(trade_check["silver"] ~= nil and trade_check["silver"] ~= 0) then
		trade_check_money = trade_check_money + (trade_check["silver"] * 10);
	end

	if(trade_check["copper"] ~= nil and trade_check["copper"] ~= 0) then
		trade_check_money = trade_check_money + trade_check["copper"];
	end

	return_money = return_money + trade_return["platinum"] * 1000 + trade_return["gold"] * 100;
	return_money = return_money + trade_return["silver"] * 10 + trade_return["copper"];

	if(return_money < trade_check_money) then
		return false;
	else
		return_money = return_money - trade_check_money;
	end

	if(not keepitems) then
		--replace trade with trade_return
		trade.item1 = trade_return.item1;
		trade.item2 = trade_return.item2;
		trade.item3 = trade_return.item3;
		trade.item4 = trade_return.item4;
	else
		trade.item1 = 0;
		trade.item2 = 0;
		trade.item3 = 0;
		trade.item4 = 0;
		npc:DeleteQuestLoot(item1, item2, item3, item4);
	end

	trade.platinum = math.floor(return_money / 1000);
	return_money = return_money - (trade.platinum * 1000);

	trade.gold = math.floor(return_money / 100);
	return_money = return_money - (trade.gold * 100);

	trade.silver = math.floor(return_money / 10);
	return_money = return_money - (trade.silver * 10);

	trade.copper = return_money;
	return true;
end

function items.return_items(npc, client, trade, text)
	text = text or true;
	local returned = false;
	for i = 1, 4 do
		local inst = trade["item" .. i];
		if(inst.valid) then
			local itemid = inst:GetID();
			local charges = inst:GetCharges();
			client:SummonItem(itemid,charges);
			if(text == true) then
				npc:Say(string.format("I have no need for this item %s, you can have it back.", client:GetCleanName()));
			end
			returned = true;
		end
	end

	local money = false;
	if(trade.platinum ~= 0) then
		returned = true;
		money = true;
	end

	if(trade.gold ~= 0) then
		returned = true;
		money = true;
	end

	if(trade.silver ~= 0) then
		returned = true;
		money = true;
	end

	if(trade.copper ~= 0) then
		returned = true;
		money = true;
	end

	if(money == true) then
		client:AddMoneyToPP(trade.copper, trade.silver, trade.gold, trade.platinum, true);
	end

	return returned;
end

return items;
