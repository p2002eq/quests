-- This is to spawn a lesser spirit upon an_iksar_marauder's death for Shaman epic 1.0
function event_death_complete(e)
	eq.spawn2(78211,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end