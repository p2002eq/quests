function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Say("Welcome to Broken Skull Rock!  I would stay here with you, but I am afraid that I must head back to Stonebrunt to pick up another load.  You will find many of your basic supplies from the residents of the lighthouse.  I can assure you of the quality of the goods they sell.  A short swim south of the lighthouse you will find a small beach; That is the only way to enter Broken Skull Rock, aside from getting yourself kidnapped and forced to work in the Torgiran Mines... This is much more pleasant, trust me.  Be safe.  If you need a ride back to Odus, I am sure I can find a place for you to ride on one of my return trips.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end