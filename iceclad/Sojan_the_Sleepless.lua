function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 25104})) then -- toolset Delivery (kael)
		e.self:Say("Uhhh, thank you... Now I can uhh... work on fixing some things around...");
		e.self:Emote("seems to nod off for a moment as he drops a small note on the ground.");
		e.other:QuestReward(e.self,0,0,0,0,20474);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
    e.self:Emote("sighs and stares at the ground solemnly");
end