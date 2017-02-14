---- Quest:Johanius Stake of Slaying
function event_spawn(e)
    e.self:SetAppearance(1);
    eq.set_timer("aellana", 1800000);
end

function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("The Coterie of the Eternal Night is holding us captive! We can not leave until all the vampyres that reside in this village have been destroyed! If any of them are missing I assure you they will return! My brother Johanius is an experienced vampyre slayer and will coming for us soon!");
    end
end

function event_timer(e)
    if (e.timer == "aellana") then
        eq.depop();
    end
    eq.stop_timer(e.timer)
end

function event_signal(e)
    if(e.signal == 1) then
        eq.start(3);
        e.self:Say("Dearest brother, how releaved I am to see you again!");
    elseif(e.signal == 2) then
        eq.depop();
    end
end

function event_waypoint_arrive(e)
    if(e.wp == 21) then
        e.self:Say("We will see you at home Johanius, please hurry.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end