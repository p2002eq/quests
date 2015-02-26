function event_combat(e)
    e.self:Emote("hatch from inside your brain!");
    spawn_imps(e);
end

function spawn_imps(e)
    local imp_id = 76386;
    local xloc = e.self:GetX();
    local yloc = e.self:GetY();
    local zloc = e.self:GetZ();
    local roll = math.random(100);
    if roll < 33 then
        local imp = eq.spawn2(imp_id,0,0,xloc,yloc,zloc,0);
        imp:AddToHateList(e.other, 1);
    elseif roll >= 33 and roll <=66 then
        local imp = eq.spawn2(imp_id,0,0,xloc,yloc,zloc,0);
        imp:AddToHateList(e.other, 1);
        local imp2 = eq.spawn2(imp_id,0,0,xloc,yloc,zloc,0);
        imp2:AddToHateList(e.other, 1);
    elseif roll > 66 then
        local imp = eq.spawn2(imp_id,0,0,xloc,yloc,zloc,0);
        imp:AddToHateList(e.other, 1);
        local imp2 = eq.spawn2(imp_id,0,0,xloc,yloc,zloc,0);
        imp2:AddToHateList(e.other, 1);
        local imp3 = eq.spawn2(imp_id,0,0,xloc,yloc,zloc,0);
        imp3:AddToHateList(e.other, 1);
    end
    e.self:Depop(true);
end
