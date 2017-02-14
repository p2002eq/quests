function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Make your self welcome friend! We're all here for the same reason. To relax with congenial company and get a bit sloshed to forget about the vampyre villains and Inquisition spies lurking about! Haha! At any rate you're safe here with us friend!");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
    if(e.signal == 1) then
        e.self:Say("I hope you're planning on cleaning that spill up for us, Olam!");
        eq.signal(160219,9,9000); -- Lyneea_Doyle
    end
end