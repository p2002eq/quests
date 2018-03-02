function event_death_complete(e)
    local random_result = math.random(100);
	if(random_result <= 5) then
        eq.spawn2(111243,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1); --spawn the enraged relative on death
    end
   
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
