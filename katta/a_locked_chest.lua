---- Quest:Vampyre Troubles
function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 31758})) then -- Old Bone Key
        eq.set_global("katta_shade_combat",e.other:GetName(),3,"M10");
        eq.signal(160129,1,2000);
        eq.signal(160130,1,2000);
        eq.signal(160385,1,2000);
        eq.signal(160386,1,2000);
        eq.spawn2(160480,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
        eq.depop_with_timer();
    end
    item_lib.return_items(e.self, e.other, e.trade)
end