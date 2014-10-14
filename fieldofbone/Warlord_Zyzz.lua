function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("There is little time for talk. There are plenty of [tiny invaders]. Do your part and exterminate as many as you can. All of Cabilis shall look favorably upon you in the long run.");
	elseif(e.message:findi("tiny invaders")) then
		e.self:Say("The small scorpions have been turning up everywhere!! One can hardly sleep when thinking of the little monsters. Please crush as many as you can for the greater good. I will even pay a bounty for every four Scorpion Pincers you return.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 12650, item2 = 12650, item3 = 12650, item4 = 12650})) then --Handin: 4x Scorpion Pincers
		e.self:Say("Magnificent!! The more pincers I get the lesser scorpions there are. Here. Take the bounty.");
		e.other:Faction(193,5);  -- +Legion of Cabilis
		e.other:Faction(30,5);   -- +Cabilis Residents
		e.other:Faction(282,5);  -- +Scaled Mystics
		e.other:Faction(62,5);   -- +Crusaders of Greenmist
		e.other:Faction(317,5);  -- +Swifttails
		e.other:QuestReward(e.self,4,2,0,0,0,10);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 18213})) then
		e.self:Say("Ah!! Good to have you on board. We lack strong young recruits such as yourself. Take this box. Your task is to seek milita skeletons near this gate. Apparently, someone or something has been raising militia corpses and they now walk the land not knowing the difference between friend or foe. They even continue using their old call, 'Halt Who goes there?'. Fill and combine within the box their charred bone shards and return the filled box to me for your geozite tool.");
		e.other:QuestReward(e.self,0,0,0,0,17996);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 12668})) then
		e.self:Say("Great work!! You have helped keep the gate safe. I reward you with the geozite tool. You may find its purpose within Cabils' warriors guild. A true Iksar warrior should always have one.");  --text not from live
		e.other:QuestReward(e.self,0,0,0,0,12657);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
