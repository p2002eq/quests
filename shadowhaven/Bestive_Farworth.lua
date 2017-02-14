---- Quest:Pristine Beetle Box
function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Hello, " .. e.other:GetName() .. ". I have some heavy duty ruff 'n tuff storage devices for sale. You may not want to carry them 'round much, unless you're the burly type. Even the beetle box I made is kinda heavy.");
    elseif(e.message:findi("beetle box")) then
        e.self:Say("You're interested in it? Great! I made this beetle box from the undamaged carapace of a Rhino Beetle. It was sold to me for a very fair price in the Bazaar. Should you discover one of these pristine, undamaged carpaces, bring it to me along with 10 gold and I will make you one of your own.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30662, gold = 10})) then -- Pristine Rhino Beetle Carapace
        e.self:Emote("rattles around in a drawer and pulls out some tools and hinges. 'Ah yes, this will do. shouldn't take but a minute.'");
        e.self:Say("Yep! Here you are, one pristine beetle box to go and I will even throw in a little spare coin to go in it. Remember,they are quite special-you can only ever carry one.");
        e.other:Faction(338,2); -- Traders of the Haven
        e.other:Faction(152,1); -- House of Fordel
        e.other:Faction(153,1); -- House of Midst
        e.other:Faction(154,1); -- House of Stout
        e.other:QuestReward(e.self,8,2,0,0,17072,1000); -- Pristine Beetle Box
    end
    item_lib.return_items(e.self, e.other, e.trade)
end