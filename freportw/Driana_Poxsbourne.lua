function event_say(e)
	e.self:Say("Leave before I call the guard. Don't come back, " .. e.other:Race() .. ".");
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 1797,item2 = 1797,item3 = 1797})) then
		e.self:Say(string.format("Ahh wonderful work %s Here is the substance....don't spill it HAHAHAaahhahehehe...yes......you don't want to spill that heheh.",e.other:GetName()));
		e.other:Faction(21,2,0); -- Bloodsabers
		e.other:Faction(135,-1,0); -- Guards of Qeynos
		e.other:Faction(235,1,0); -- Opal Dark Briar
		e.other:Faction(257,-1,0); -- Priests of Life
		e.other:Faction(53,1,0); -- Corrupt Qeynos Guards
		e.other:QuestReward(e.self,0,0,0,0,1793,2000); -- Putrid substance
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:freportw  -- Driana_Poxsbourne