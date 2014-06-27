function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail. " .. e.other:GetName() .. " - If you are interested in helping the League of Antonican Bards by delivering some mail then you should talk to Idia.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 18161})) then
		e.self:Say("Incoming mail - very good!  Please take this gold for your troubles.");
		e.other:Faction(192,10); -- league of antonican bards
		e.other:Faction(184,1); -- knights of truth
		e.other:Faction(135,1); -- guards of qeynos
		e.other:Faction(273,-1); -- ring of scale
		e.other:Faction(207,-1); -- mayong mistmoore
		e.other:QuestReward(e.self,0,0,math.random(9),math.random(9),0,100);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18160}) or item_lib.check_turn_in(e.trade, {item1 = 18162}) or item_lib.check_turn_in(e.trade, {item1 = 18163})) then
		quest::say("Incoming mail - very good!  Please take this gold for your troubles.");
 		e.other:Faction(192,10); -- league of antonican bards
		e.other:Faction(184,1); -- knights of truth
		e.other:Faction(135,1); -- guards of qeynos
		e.other:Faction(273,-1); -- ring of scale
		e.other:Faction(207,-1); -- mayong mistmoore
		e.other:QuestReward(e.self,0,0,math.random(9),math.random(9),0,200);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:gfaydark