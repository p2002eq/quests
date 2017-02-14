---- Quest:Vampyre Troubles
function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Greetings. I am in the middle of some important research so regrettably do not have the time to converse.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 7373, item2 = 7374, item3 = 7374, item4 = 7374})) then -- Autarkic Shade Lord Robe & 3x Autarkic Shade Robe
        e.self:Say("Hopefully these robes still contain enough of a magical imprint from the shades to be useful in successfully warding the Magus Conlegium from their kind. Thank you for you assistance. Keep this token as a symbol of your allegiance to the Magus Conlegium.");
        e.other:Faction(206,5); -- Magus Conlegium
        e.other:Faction(168,5); -- Katta Castellum Citizens
        e.other:Faction(350,5); -- Validus Custodus
        e.other:Faction(284,-5); -- Seru
        e.other:Faction(139,-5); -- Hand of Seru
        e.other:Faction(96,-5); -- Eye of Seru
        e.other:Faction(138,-5); -- Hand Legionnaries
        e.other:QuestReward(e.self,0,0,0,0,7361,1000000); -- Enchanted Record of Events
    end
    item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
    if(e.signal == 1) then
        eq.depop_with_timer();
    end
end