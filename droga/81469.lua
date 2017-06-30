-- Shaman Skull Quest 6
function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Emote("peers up at you. His face is covered with grime and he shows scars from goblin whips. He shakes his head and goes back to his thoughts.");
    elseif(e.message:findi("What is your name")) then
        e.self:say("My name is Digalis");
    end
end