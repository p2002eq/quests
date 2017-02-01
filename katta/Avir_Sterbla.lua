---- Quest:Vampyre Ash & Blood
function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Greetings " .. e.other:GetName() .. ". I am Avir Sterbla, Governor of Magician Studies here at the Magus Conlegium of Katta Castellum. I am currently in the middle of researching more effective magical methods of combating the [vampyres] of the Coterie of the Eternal Night. Governor Drenic Garrison has been assisting me with the scientific side of the research, that having to do with physical materials that have detrimental effects on the vampyres while my research is more with magical elements.");
    elseif(e.message:findi("vampyres")) then
        e.self:Say("The vampyres are becoming a larger threat to the safety of our citizens and it is the responsibility of the Magus Conlegium to find magical ways of stifling this threat while the Validus Custodus fight them with physical means. However, I am running short on research components. I will trade for every four samples of vampyre blood or every four piles of vampyre ashes.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 2692, item2 = 2692, item3 = 2692, item4 = 2692})) then -- 4x Vampyre Ashes
        e.self:Emote("Thank you " .. e.other:GetName() .. "! These samples will be put to good use I assure you. The Coterie will not stand much longer against the forces of Katta Castellum.");
        e.other:Faction(206,3); -- Magus Conlegium
        e.other:Faction(168,1); -- Katta Castellum Citizens
        e.other:Faction(350,1); -- Validus Custodus
        e.other:Faction(284,-1); -- Seru
        e.other:Faction(139,-1); -- Hand of Seru
        e.other:Faction(96,-1); -- Eye of Seru
        e.other:Faction(138,-1); -- Hand Legionnaries
        e.other:SummonItem(10015, 8); --
        e.other:QuestReward(e.self,0,0,0,0,0,10000); --
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 2693, item2 = 2693, item3 = 2693, item4 = 2693})) then -- 4x Vampyre Blood
        e.self:Emote("Thank you " .. e.other:GetName() .. "! These samples will be put to good use I assure you. The Coterie will not stand much longer against the forces of Katta Castellum.");
        e.other:Faction(206,3); -- Magus Conlegium
        e.other:Faction(168,1); -- Katta Castellum Citizens
        e.other:Faction(350,1); -- Validus Custodus
        e.other:Faction(284,-1); -- Seru
        e.other:Faction(139,-1); -- Hand of Seru
        e.other:Faction(96,-1); -- Eye of Seru
        e.other:Faction(138,-1); -- Hand Legionnaries
        e.other:SummonItem(10015, 8); --
        e.other:QuestReward(e.self,0,0,0,0,0,10000); --
    end
    item_lib.return_items(e.self, e.other, e.trade)
end