function event_say(e)
    if (e.message:findi("hail")) then
        e.self:Say("Hey there stranger, pleased to meet you. I'm Ruru, I do the cooking around here. I'm the best cook around these parts. So, if you get hungry, you'd best be making sure you're coming to see me.");
        eq.signal(114467, 3, 4); --Grudash
    end
end

function event_signal(e)
    if (e.signal == 1) then
        e.self:Say("Hah! Whatever Grudash. You know that my Roasted Walrus in Plum Sauce is better. You just don't want to admit it.");
        eq.signal(114467, 1, 4); --Grudash
    elseif (e.signal == 2) then
        e.self:Say("Just you wait, just you wait! One of these days Grudash, you'll see.");
    elseif (e.signal == 3) then
        e.self:Say("Bah!");
    elseif (e.signal == 4) then
        e.self:Say("grumbles, 'Bah, this still doesn't settle anything Grudash. This stranger obviously has no taste for fine cuisine.'");
    elseif (e.signal == 5) then
        e.self:Emote("laughs, 'Don't get me started. You know that my cuisine Is prefered over yours two to one.'");
    end
end

function event_trade(e)
    local item_lib = require('items');
    item_lib.return_items(event.self, event.other, event.trade);
end