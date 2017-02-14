---- Quest:Duke Norfin's Delivery
function event_spawn(e)
    shipment = 0;
end

function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Can't you see I'm, eh, busy here? Leave me be.");
    elseif(e.message:findi("goods") and shipment == 1) then
        e.self:Say("You will, will you. That would be great. Make sure the guards don't stop you while you have this stuff. And if you get caught, I'll deny any knowledge of you. Now get out of here.");
        e.other:SummonItem(19840); -- Smuggled Goods
        shipment = 0;
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 19841})) then -- Note to Jarin
        e.self:Emote("glances nervously about, 'So you're here on 'official' business eh? Well, there's not much I can do right now. I have the goods but someone caught scent of what I've been doing and there are too many people watching me to leave right now. You can tell our mutual friend that he needs to wait for things to calm down or send someone else to bring back the [goods].");
        e.other:Faction(141,25); -- haven smugglers
        shipment = 1
        e.other:QuestReward(e.self,0,0,0,0,0,5000); -- EXP
    end
    item_lib.return_items(e.self, e.other, e.trade)
end