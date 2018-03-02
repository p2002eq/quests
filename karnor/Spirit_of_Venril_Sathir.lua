-- pulsing green stone - ranger/druid epic
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("So mortals, you seek to end the tainting of Tunare's children? So be it, I have no cares. My death has been caused by this foolishness and I want no more to do with it. Bring me a scroll with the knowledge of resurrection so that I may once again live. I will hand you that which you seek.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 15392})) then
		e.self:Say("I am alive! My thanks to you, " .. e.other:GetName() .. ". And now I will aid you in your quest for preserving the forests of norrath. Your carcass will help nurture the soils of the wilderness.");
		eq.unique_spawn(102126,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
