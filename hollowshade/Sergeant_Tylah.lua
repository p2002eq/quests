----
---- Need Event Logic for Hollowshade War
---- See Perl for example design
----
function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Say("Good day to you " .. e.other:GetName() .. "would you happen to have any boiled rockhopper eggs for sale? I'm so very hungry and they're my favorite food.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 3457, item2 = 3457, item3 = 3457, item4 = 3457})) then -- 4x Boiled Rockhopper Egg
        e.self:Say("devours all four of the eggs in the blink of an eye, 'Delicious! May the spirits bless you $name! Here are a few acrylia flakes for your trouble. I'll be happy to pay for more should you find yourself with any extra!");
        e.other:QuestReward(e.self,0,0,0,0,3459); -- Acrylia Flakes
    end
    item_lib.return_items(e.self, e.other, e.trade)
end