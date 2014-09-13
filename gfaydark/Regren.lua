function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome, warrior! Show the Emerald Warriors your mettle and bring me a ruined wolf pelt, some bat fur, some bone chips, and a spiderling eye from the depths of Greater Faydark. If you succeed, my admiration and a reward will be yours. To battle!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 18782})) then -- Recruitment Letter
		e.self:Say("Welcome to the Emerald Warriors. Hmmm, you have a lot of training to do, so let's get started right away. Here's our guild tunic, represent us well, young " .. e.other:GetName() .. ".");
		e.other:Faction(92,100); -- Emerald Warriors
		e.other:Faction(155,-15); -- Indigo Brotherhood
		e.other:Faction(212,10); -- Merchants of Felwithe
		e.other:Faction(174,10);  -- Kelethin Merchants
		e.other:QuestReward(e.self,0,0,0,0,13533,100);  -- Old Green Tunic
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13073,item2 = 13782,item3 = 13253,item4 = 13069})) then
		e.self:Say("Fine work! You are on your way to becoming an adequate combatant.");
		e.other:Faction(92,10);
		e.other:Faction(155,-1);
		e.other:Faction(174,1);
		e.other:Faction(212,1);
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(5013,5014,5015,5016,5019,5020,5021,5022,5023,5024,5025,5042,5043,5044,5045,5046,5047,5048,5049,5070,5071,6011,6013,6014,6015,6016,6030,6031,6032,6033,7007,7008,7009,7010,7021,7022,7023,7024),500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:gfaydark  ID:54093 -- Regren