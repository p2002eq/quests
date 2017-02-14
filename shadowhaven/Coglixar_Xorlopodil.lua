---- Quest:Mining Operation
function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Hello there, " .. e.other:GetName() .. ". It's nice to meet you. Are you just passing through our fine city or do you have dealings you need to address to me personally? Also, if ye know anyone that will want to [assist] with some deliveries to our mining contingent in the Paludal caverns let me know.");
    elseif(e.message:findi("assist")) then
        e.self:Say("That is great to hear, " .. e.other:GetName() .. ". I have a task for you to complete for me first and if you are able to complete it I may have other things for you in the future. I have heard word that some of our dwarf workers in the [mining operation] are in need of some food.");
    elseif(e.message:findi("mining operation")) then
        e.self:Say("In the Paludal caverns our workers are starting to get very low on rations and are working with very old and tarnished mining utensils. I need you to deliver these rations to Daesorak first and then see what supplies he thinks they need. He is the one overseeing the operation and will be able to tell you what supplies he needs and what quanity is necessary.");
        e.other:SummonItem(4747); -- Bag of Rations
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end