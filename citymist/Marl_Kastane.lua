-- Part of SK Epic 1.0
function event_spawn(e)
	--e.self:Say("Alas, I cannot be the one to carry the sword back to my people as proof in fear they will kill me to possess it for their own. I think a simple trade is in order, perhaps you have a symbol or token of Lhranc's that I could take back to the others to ease their worries?");
	eq.set_timer("depop",4800000);
end

function event_say(e)
	if(e.message:findi("hail")) then--True Spirit
		e.self:Say("Alas, I cannot be the one to carry the sword back to my people as proof in fear they will kill me to possess it for their own. I think a simple trade is in order. Perhaps you have a symbol or token of Lhanrc's that I could take back to the others to ease their worries?");
	else
		e.self:Emote("seems to ignore you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 14384})) then
	    e.self:Say("Very good, I will go deliver this right away.");
	    e.other:QuestReward(e.self,0,0,0,0,14383);
	end
		item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	eq.stop_timer("depop");
	eq.depop();
end


--fiddlemetimbers