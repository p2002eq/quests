-- Shaman Skull Quest 8
function event_death_complete(e)
	eq.unique_spawn(105271,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ()); -- the spirit of Rile
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end