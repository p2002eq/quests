function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Say("Greetings " .. e.other:GetName() .. ". I am Erikal Wolfeye, Governor of exploration. Unfortunately, my duties to Katta Castellum tend to keep me from doing much of the actual exploring, but we have many fine men and women out in the field. That reminds me, I will have to check in with [" .. eq.say_link("Corporal Donfeld") .. "] and see how his new project is going.");
    elseif(e.message:findi("corporal donfeld")) then
        e.self:Say("Corporal Donfeld has a very important job to do for me - reaching out and trying to make new allies is crucial to our future here on Luclin.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end