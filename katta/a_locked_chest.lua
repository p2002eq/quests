---- Quest:Vampyre Troubles
function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 31758})) then -- Old Bone Key
        eq.signal(160129,1,1); -- Send Event
        eq.signal(160130,1,1); -- Send Event
        eq.spawn2(160480,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
    end
    item_lib.return_items(e.self, e.other, e.trade)
end