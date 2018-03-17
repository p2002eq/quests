function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("If you wish to stay here by all means go ahead. Most of the animals who roam in this area are afraid of fire. They tend to stay away from it, but the courageous ones do tend to get close. And they're always venturing into the [" .. eq.say_link("ponds") .. "].");
    elseif(e.message:findi("ponds")) then
        e.self:Say("The ponds are known as the Ponds of Infulence. It carries a special power. All the animals here can feel it. Just take notice and see how the animals are always swimming into the water.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end