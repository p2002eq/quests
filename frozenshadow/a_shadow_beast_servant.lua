function event_death_complete(e)
    local random_result = math.random(100);
	if(random_result <= 15) then
        eq.spawn2(111254,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1); --spawn n_enraged_shadow_beast on death
    end
   
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
