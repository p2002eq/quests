---- Quest:Steaon's Deliveries
function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Hail " .. e.other:GetName() .. ". You will have to excuse me because I am quite busy with my work and trying to sort out my [" .. eq.say_link("deliveries") .. "]. However, please help yourself to anything in my store that may be to your liking.");
    elseif(e.message:findi("deliveries")) then
        e.self:Say("You see, I have to make more and more deliveries everyday, what with my business growing so much. I find it difficult to make time to go pick up the different skins and pelts I need for my trade. It's tough when you need some good help but can't afford to pay them. Sorry to bother you with my banter, perhaps I will find someone on the [" .. eq.say_link("way to the bazaar") .. "].");
    elseif(e.message:findi("way to the bazaar")) then
        e.self:Say("You are, eh ".. e.other:GetName() .. "? Well then if you wanted to pick up some supplies for me and deliver them to my partner in the Bazaar I'm sure I would be very grateful. Would you like to make a [" .. eq.say_link("trip to the bazaar") .. "]");
    elseif(e.message:findi("trip to the bazaar")) then
        e.self:Say("All right! Great to hear that " .. e.other:GetName() .. ". Here are the supplies I need delivered to my partner Gearo in the Bazaar. Please take them to him and return with whatever he has picked up for me. I look forward to seeing you soon, and thank you.");
        e.other:SummonItem(4766); -- Assorted Tailoring Supplies
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4767})) then -- Bag of Assorted Gems
        e.self:Say("Hey again " .. e.other:GetName() .. ". It's nice to see you back so soon, thank you for bringing my supplies to that crazy Gnome and bringing back my gems that he got for me. You are always welcome in my shop, good luck to you!");
        e.other:Faction(338, 25); -- Traders of the Haven
        e.other:Faction(152, 2); -- House of Fordel
        e.other:Faction(153, 2); -- House of Midst
        e.other:Faction(154, 2); -- House of Stout
        e.other:QuestReward(e.self,0,0,0,0,0,500); -- Faction and EXP
    end
    item_lib.return_items(e.self, e.other, e.trade)
end