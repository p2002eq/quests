---- Quest:Johanius Stake of Slaying

function event_say(e)
    fac = e.other:GetFaction(e.self);
    if(e.message:findi("hail")) then
        if(fac < 6) then
            e.self:Say("Greetings traveler! You seem like a brave individual for having dared the Tenebrous Mountains without a patrol of Validus Custodus to defend you! I am need of some assistance in an [urgent matter]!");
        elseif(fac > 5) then
            e.self:Say("You are a brave individual but unfortunately I cannot trust that you will use what I have to offer to its fullest potential against the foes of Katta Castellum. Perhaps when you have established a stronger reputation as a vampyre slayer I will aid you further.");
        end
    elseif(e.message:findi("urgent matter") and (fac < 6)) then
        e.self:Say("My sister and my beloved Lyrra have been captured by the vile blood suckers and are being held in the largest of their dark settlements. I can not face that number of blood suckers alone. Are you prepared to slay the wicked undead?");
    elseif(e.message:findi("prepared to slay") and (fac < 6)) then
        e.self:Say("Excellent, I commend you in advance for your courage. Let us make haste lest something awful happen to my loved ones!");
        eq.start(2);
    end
end

function event_waypoint_arrive(e)
    if e.wp >= 11 then
        eq.stop()
        eq.load_encounter('Johanius');
        eq.set_timer('cleanup', 2 * 60 * 60 * 1000) -- 2 hour depop timer
    end
end

function event_timer(e)
    if e.timer == 'cleanup' then
        eq.depop(172192)
        eq.depop(172193)
        eq.unload_encounter('Johanius');
        eq.depop_with_timer()
    end
end

function event_signal(e)
    if(e.signal == 1) then
        eq.unload_encounter('Johanius');
        eq.depop_with_timer();
    elseif(e.signal == 2) then
        eq.depop_with_timer();
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end