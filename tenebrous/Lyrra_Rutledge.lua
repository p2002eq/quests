---- Quest:Johanius Stake of Slaying

function event_spawn(e)
    e.self:SetRunning(true);
end

function event_waypoint_arrive(e)
    if e.self:GetGrid() == 11 then
        eq.depop()
    end
end

function event_signal(e)
    if(e.signal == 1) then
        eq.start(4);
        e.self:Say("Johanius my love! You and your companions have rescued us from those horrible creatures!");
    elseif e.signal == 2 then
        eq.start(11) -- this is just a depop grid (single point, depops immediately upon hitting it)
        e.self:Say("We will see you at home Johanius, please hurry.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end
