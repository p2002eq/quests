local war_started = false

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, outlander. Unless ye have orders from the Dain, leave me be. I must man my post.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30369, item2= 1567})) and not war_started then -- 9th ring and declaration of war
		e.other:AddEXP(20000);
		e.other:SummonItem(30369);
		e.self:Say(string.format("I'll be right with you, %s.",e.other:GetCleanName()));
		e.self:AddItem(30645, 0, true);
		e.self:DoAnim(41);
		e.self:Emote("breathes deeply and blows into an ornate horn.");
		eq.set_timer("smallPause", 2500);
		war_started = true
	end
	
	item_lib.return_items(e.self, e.other, e.trade);
end

function event_timer(e)
	if e.timer == "smallPause" then
		eq.stop_timer("smallPause")
		eq.zone_emote(1, 'The sound of a mighty horn echoes through the area. All local inhabitants scurry to take cover.');
		eq.load_encounter("RingTen");
	end
end