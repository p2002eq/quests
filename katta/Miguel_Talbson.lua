function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Greetings friend! Pull on up to the bar and have a drink. and watch out for that Lyneea if she asks you to play a game of coppers! I've seen that lass outdrink that drunken dwarf Borean and that's quite a task!");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end