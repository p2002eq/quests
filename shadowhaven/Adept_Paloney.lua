function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Due to the problems we have had lately with dishonorable visitors to the Haven we require all newcomers to see Daloran and Mistala for some simple tasks to prove that your intentions are good. I hope to see you soon.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end