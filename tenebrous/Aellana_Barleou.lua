---- Quest:Johanius Stake of Slaying

function event_spawn(e)
    started = false;
    e.self:SetRunning(true);
end

function event_say(e)
    if not started and e.message:findi("hail") then
        e.self:Say("The Coterie of the Eternal Night is holding us captive! We can not leave until all the vampyres that reside in this village have been destroyed! If any of them are missing I assure you they will return! My brother Johanius is an experienced vampyre slayer and will coming for us soon!");
    end
end

function event_waypoint_arrive(e)
    if e.self:GetGrid() == 11 then
        eq.depop()
    end
end

function event_signal(e)
    if(e.signal == 1) then
        started = true;
        eq.start(4);
        e.self:Say("Dearest brother, how relieved I am to see you again!");
    elseif e.signal == 2 then
        eq.start(11) -- this is just a depop grid
        e.self:Say("We will see you at home Johanius, please hurry.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end