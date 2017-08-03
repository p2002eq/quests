---- Quest:Bronus' Amulet
function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Hello, you look like a battleworn traveller. Have you heard of the place where [" .. eq.say_link("Grieg") .. "] resides?");
    elseif(e.message:findi("Grieg")) then
        e.self:Say("Aye, Grieg Veneficus. We do not know much about this madman, only where his [" .. eq.say_link("stronghold") .. "] is. One of my friends from the Eye was sent there to investigate it, but he has not returned. It has been quite some time and I am very worried about him.");
    elseif(e.message:findi("stronghold")) then
        e.self:Say("Grieg's End is what it has become to be known as. Some reports have come back that this place is cursed with foul visages. Any entering will surely loose their minds. I.. I would go but you see I am desperately busy here in the city doing..uh..many important things! You look like you could help, will you [" .. eq.say_link("travel") .. "] to Grieg's End and look for my friend?");
    elseif(e.message:findi("travel")) then
        e.self:Say("Good, I am glad you would prove yourself useful to Seru. Look for Bronus, you should beware if he has lost his sanity for he is almost as powerful as myself.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 6515})) then -- Cracked Amulet
        e.self:Emote("speaks a small incantation as he pulls a branch from a nearby tree and ties it around the amulet 'I shall mourn him dearly, he was a good friend. This was the amulet that I had given him before he left to explore Grieg's End. I want you to have this for helping to find his lost soul. Go in peace my friend.");
        e.other:QuestReward(e.self,0,0,0,0,6516,1000); -- Nilibiks Yew Affixed Amulet
    end
    item_lib.return_items(e.self, e.other, e.trade)
end