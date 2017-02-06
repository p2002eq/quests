---- Quest:Johanius Stake of Slaying
function event_waypoint_arrive(e)
    if(e.wp == 4) then
        e.self:Say("We had best save our sentiments for later and make haste back to the safety of Katta Castellum!");
    elseif(e.wp == 5) then
        eq.signal(172192,1,1); -- Aellana_Barleou
        eq.signal(172193,1,1); -- Lyrra_Rutledge
    elseif(e.wp == 25) then
        e.self:Say("Hurry inside the gates ladies I will be in shortly after rewarding the brave individuals that assisted me in your rescue.");
    elseif(e.wp == 26) then
        eq.spawn2(172191,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #Johanius_Barleou_the_Slayer
        eq.depop();
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end