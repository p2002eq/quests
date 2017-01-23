function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Please do not think poorly of me, but I must see your Journeyman's Cloak if you wish to converse. Be quick about it. This place is not completely safe.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    -- Cloak of the Dar Khura Journeyman OR Cloak of the Jharin Journeyman OR Cloak of the Khala Dun Journeyman OR Cloak of the Khati Sha Journeyman OR Cloak of the Taruun Journeyman
    if item_lib.check_turn_in(e.self, e.trade, {item1 = 6267}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 6159}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 6222}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 6184}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 6275}) then
        e.self:Say("Ah, there it is... I haven't seen one of those in a while. I remember when I first became a journeyman myself. That was many seasons and twice as many trails ago. Time becomes most deft in the period just after you figure that you've got a grasp on it.");
        e.self:Say("Well, let us get back to pebbles and tax, shall we? You displayed a great deal of bravery in coming out here and looking for me. I fear my age is beginning to show. I can't evade danger as I did in my youth. With that in mind, I would like you to take this journal back to town for me. Historian Sharar will tend to my notes for me. She is a trusted friend and a valuable scholar. Please give it to her with my thanks.")
        e.other:QuestReward(e.self,0,0,0,0,8466); -- Ahoms Journal
    end
    item_lib.return_items(e.self, e.other, e.trade)
end

