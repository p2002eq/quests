function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("ignores you.");
	end
end

function event_spawn(e)
	eq.set_proximity(e.self:GetX()-50,e.self:GetX()+50,e.self:GetY()-50,e.self:GetY()+50);
end

function event_enter(e)
	if(e.other:Class() == "Monk") then
		-- Monk Epic 1.0
		eq.attack(e.other:GetName());
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end