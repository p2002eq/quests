function event_signal(e)
    if (e.signal == 1) then
        e.self:Say("Don't be thinkin' I was forgettin' ya, Nilham, ya spotty-faced salt licker. Remember, ya tell us where ya put our rum, an' we let ya out. Otherwise, ya have ta stay here!");
        eq.spawn2(110218, 0, 0, 1318, 4557, 72, 6);
        eq.signal(110218,1,4000);
    end
end

function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Don't be thinkin' I was forgettin' ya, Nilham, ya spotty-faced salt licker. Remember, ya tell us where ya put our rum, an' we let ya out. Otherwise, ya have ta stay here!");
        eq.spawn2(110218, 0, 0, 1318, 4557, 72, 6);
        eq.signal(110218,1,4000);
    end
end