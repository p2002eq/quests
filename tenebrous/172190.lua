-- #Sir_Johanius_Barleou (172190) for Stake quest

function event_spawn(e)
    e.self:SetRunning(true);
    eq.start(3);
end

function event_waypoint_arrive(e)
    if e.wp >= 5 and e.self:GetGrid() == 3 then
        e.self:Say("We had best save our sentiments for later and make haste back to the safety of Katta Castellum!");
        eq.signal(172192,1); -- Aellana_Barleou
        eq.signal(172193,1); -- Lyrra_Rutledge
        eq.set_timer('return_trip', 2000);
        eq.stop();
    elseif(e.wp == 17) then
        e.self:Say("Hurry inside the gates ladies I will be in shortly after rewarding the brave individuals that assisted me in your rescue.");
        eq.signal(172192,2); -- Aellana_Barleou
        eq.signal(172193,2); -- Lyrra_Rutledge
        eq.stop()
    elseif(e.wp >= 18) then
        eq.spawn2(172191,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #Johanius_Barleou_the_Slayer
        eq.depop();
    end
end

function event_timer(e)
    eq.stop_timer(e.timer);
    if e.timer == 'return_trip' then
        eq.start(4);
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end