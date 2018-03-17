function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Here ya go. feel free to browse the selection of herbs I have to offer. Don't be thinkin you'll be walkin away with em fer free though.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end