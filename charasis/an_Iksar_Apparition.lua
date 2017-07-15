-- Shaman Skull Quest 8
function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30994})) then --Iksar Relics
        eq.unique_spawn(105182,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ()); --Venril Sathir
        eq.unique_spawn(105264,0,0,e.self:GetX()+5,e.self:GetY()-5,e.self:GetZ()); --an Arisen Disciple
        eq.unique_spawn(105265,0,0,e.self:GetX()+5,e.self:GetY()+5,e.self:GetZ()); --an Arisen Priest
        eq.unique_spawn(105266,0,0,e.self:GetX()-5,e.self:GetY()+5,e.self:GetZ()); --an Arisen Necromancer
        eq.unique_spawn(105267,0,0,e.self:GetX()-5,e.self:GetY()-5,e.self:GetZ()); --an Arisen Acolyte
        eq.depop_with_timer();
    end
    item_lib.return_items(e.self, e.other, e.trade)
end