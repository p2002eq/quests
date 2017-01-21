----
---- Need Event Logic for Hollowshade War
---- See Perl for example design
----
function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Say("Welcome to our humble outpost. traveller. Let me know if you see anything you need. I consider it an honor to sell here, for doing so enables Vah Shir in training to stay in the field.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 5566})) then -- Pot of Spicy Fish Stew
        e.self:Say("Thanks " .. e.other:GetName() .. "! That was delicious. Here is the empty bowl.");
        e.other:QuestReward(e.self,0,0,4,0,5567); -- Empty Stew Bowl
    end
    item_lib.return_items(e.self, e.other, e.trade)
end