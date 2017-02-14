function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Welcome to our shop! You'll need a strong sturdy bow if you're planning on shooting vampyres instead of straw targets. I have all the supplies you'll need to construct such a bow.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end