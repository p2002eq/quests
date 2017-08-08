function event_spawn(e)
	eq.depop(85397);
end


function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("ignores you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if((item_lib.check_turn_in(e.self, e.trade, {item1 = 1687})) and (e.other:GetLevel() > 45) and (e.other:Class() == "Monk")) then
		-- Monk Epic 1.0
		eq.depop_with_timer();
		eq.unique_spawn(85397,0,0,-541,-806,-380); -- summon trigger
		-- Spawn: Vorash
		eq.spawn2(85211,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		-- Spawn: Deep
		eq.spawn2(85223,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		
	end
	item_lib.return_items(e.self, e.other, e.trade)
end