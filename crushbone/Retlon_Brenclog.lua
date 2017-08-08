function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Oh my word!! A rescuer!! Hurry! Get me out of these chains!! Go find the orc who has the keys!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {copper = 1})) then -- 1 Copper
		e.self:Say("No, no!! I do not need this!! Get me key number 15!!");
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20015})) then -- Shackle Key 15
		e.self:Say("Good work!! I shall be on my way. Farewell my friend!!");
		e.other:Faction(176,1,0); -- King Ak'Anon
		e.other:Faction(91,1,0); -- Eldritch Collective
		e.other:Faction(115,1,0); -- Gem Choppers
		e.other:Faction(322,-2,0); -- The Dead
		e.other:QuestReward(e.self,0,7,3,0,0,1000); -- Faction, Cash and EXP
		eq.depop_with_timer();
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1717})) then -- Sealed Letter
		e.self:Say("Ah! A letter from my brother! Mmm... no... no I don't have Tergon's spellbook. The orc's prophet took it and then they locked me in chains! Now why don't you go do something useful and get me key number 15!!");
		e.other:Faction(176,1,0); -- King Ak'Anon
		e.other:Faction(91,1,0); -- Eldritch Collective
		e.other:Faction(115,1,0); -- Gem Choppers
		e.other:Faction(322,-2,0); -- The Dead
		e.other:QuestReward(e.self,0,0,0,0,0,500); -- Faction and EXP
		eq.depop_with_timer();		
	end
	item_lib.return_items(e.self, e.other, e.trade);
end