function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Welcome to Midnight Ceramics! They clay native to these lands is excellent for crafting a wide variety of ceramics. You'll have a bit of trouble if you're planning on sun baking your creations however!! giggle..giggle.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end