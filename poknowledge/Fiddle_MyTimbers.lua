function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Say("You like those Epic Quests? You're Welcome.");
    end
end