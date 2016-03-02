function event_say(e)
    if(e.message:findi("Hail")) and (e.other:HasItem(2469) or e.other:HasItem(2475)) then
        e.self:Say("I'm always watching...");
    end
end