function event_death_complete(e)
    local random_result = math.random(100);
	if(random_result <= 5) then
        eq.unique_spawn(111086,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1); --VhalSera
    end
   
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
