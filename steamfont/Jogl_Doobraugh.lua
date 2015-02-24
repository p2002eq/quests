function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hellooo!!  My name is Jogl, master engineer with the Eldrithch Collective.  And this here is Charlotte.  Pay no mind to her, She won't bite unless you attack me.");
		eq.signal(56108,1);
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 12) then
		eq.signal(56108,2);
	end
	if(e.wp == 18) then
		eq.signal(56108,3);
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 13209})) then
		e.self:Say("Hmmm. Here you go. Take this log to Drekon Vebnebber. He is the in-house merchant at Gemchoppers Hall. It is his duty to file away all these logs.");
		e.other:Faction(91,5);
		e.other:Faction(176,1);
		e.other:Faction(115 ,1);
		e.other:Faction(209,-1);
		e.other:Faction(322,-1);
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(18837,18838),100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--random 18837 and 18838 for two sepearte quests beginnings Red V and duster
--18837 used for Red V

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
