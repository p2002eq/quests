function event_death_complete(e)
    eq.unique_spawn(111147,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --spawns Iucid spirit of Abrams upon death
    
   
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end