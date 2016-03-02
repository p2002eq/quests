function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Say("I'm always watching...");
    end
end