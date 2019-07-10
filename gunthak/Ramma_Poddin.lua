-- flavor text

-- say block
function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Emote("eyes you warily before saying, 'You do not appear to be a native of Broken Skull. Have you been sent for transport?'");
    elseif(e.message:findi("transport")) then
        e.self:Say("Ahh, apparently not then! Well, if I could offer you some advice, it would be to leave this place. I have learned that advice is rarely taken without trust, so instead heed this: Obtain what supplies you may need here, and do not eat or drink anything you find inside. Do not get caught. I do not know why you are here, but I wish you luck.");
    end
end

-- return items
function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end
