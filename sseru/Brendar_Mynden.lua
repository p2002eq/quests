---- Quest:Poisoning Brendar
function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("What do you want?");
    elseif(e.message:findi("compromise")) then
        e.self:Say("A compromise? Zabaltin has fought me in every request asking for help protecting the delivery caravans! I will never work with him. Say what is that in your hand? The label looks like it is a bottle of my favorite wine. It's from Zabaltin you say? Maybe he really is trying to work things out. Well then let's open the bottle and have a drink!");
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 34036})) then -- Mug of Poisoned Ale
        e.self:Emote("opens the bottle and takes a large drink right from it. Immediately his eyes roll back into their sockets and he falls to the ground. You look around to make sure no one has seen and then take the ring from his finger. ");
        e.self:doanim(16); -- Death Animation
        e.other:QuestReward(e.self,0,0,0,0,29863,1000); -- Unadorned Ring
    end
    item_lib.return_items(e.self, e.other, e.trade)
end