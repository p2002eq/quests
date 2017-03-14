-- Cocain_God (202344) in PoK for anniversary quest!

rewards = {[10] = 31851, [5] = 31853, [3] = 31855, [7] = 31854, [6] = 31857, [11] = 31859, [4] = 31860, [9] = 31861, [12] = 31863, [128] = 31862}
race_pool = {3, 4, 5, 6, 7, 9, 10, 11, 12, 128}

function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	local hails = 0;
	if qglobals['hails'] ~= nil then
		hails = tonumber(qglobals['hails'])
	end
	
	if e.message:findi("hail") then
		hails = hails + 1;
		eq.set_global("hails", tostring(hails), 0, "M5")
		if hails == 1 and qglobals["Anniversary2"] == nil then
			e.self:Say("Well, well, well. Another year and you are here. You wish something great from me, your great God?  It's going take a lot to get me to give you these cool new items. Take this box and go speak with the others.  If they give their approval then I might share this stuff with you....or death touch you.... I'm still deciding on your mortal existence. Fill this box with their seals of approval, combine it, and show me what you make from it. Hurry, I’m not going to wait round all day!");
			eq.set_global("Anniversary2", "started", 5, "F")
			if e.other:HasItem(31961) then
				e.other:SummonItem(34051)
			else
				e.other:SummonItem(34049)
			end
		elseif hails == 1 then
			e.self:Say("Well??? Do you have something to show me?");
		elseif hails == 2 then
			e.self:Say("Move along, I'm busy!");
		elseif hails == 3 then
			e.self:Say("I said leave me alone, " .. e.other:GetName() .. "! I'm not going to tell you again!");
		elseif hails >= 4 then
			e.self:Say("Bah! Begone mortal!");
			e.other:Kill();
		end	
	end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.self, e.other);
	
	if qglobals["Anniversary2"] == "started" then
		if qglobals["Anniversary"] ~= nil and item_lib.check_turn_in(e.self, e.trade, {item1 = 31961}) then -- P2002's Rod of Infinite Glory (1-year item)
			e.self:Say("Yes, you've done well. Here is your reward for help all of us!")
			e.other:SummonItem(31961) -- P2002's Rod of Infinite Glory  returned
			e.other:QuestReward(e.self,0,0,0,0,pick_reward(e.other)) -- random(ish) mask
			eq.set_global("Anniversary2", "rewardYear1", 5, "F")
		elseif item_lib.check_turn_in(e.self, e.trade, {item1 = 34050}) then -- P2002's Rod of Sustained Glory (2-year item)
			e.self:Say("Looks like you're an old timer! Thank you. Let me find you something nice!")
			e.other:SummonItem(34050) -- P2002's Rod of Sustained Glory   returned
			e.other:QuestReward(e.self,0,0,0,0,pick_reward(e.other)) -- random(ish) mask
			eq.set_global("Anniversary2", "rewardYear2", 5, "F")
		end
	elseif qglobals["Anniversary2"] == "rewardYear1" or qglobals["Anniversary2"] == "rewardYear1" then
		e.self:Say("You can't bribe me! You already got your reward!")
	end
	
	item_lib.return_items(e.self, e.other, e.trade);
end

function pick_reward(player)
	local race = player:GetRace();
	
	repeat
		reward_race = eq.ChooseRandom(unpack(race_pool));
	until reward_race ~= race and not e.other:HasItem(rewards(reward_race))

	return rewards(reward_race)
end
