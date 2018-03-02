---- Quest:Vampyre Troubles
function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Greetings traveler! You look like you're still breathing and have your blood running through your veins so I suppose you may seek shelter behind the mighty walls of Katta Castellum.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 31756})) then -- Orders for Legionnaire Falion
        e.self:Say("A Vah Shir vampyre!! Isn't that disturbing! How are you supposed to spot its pale skin under all that fur! Come to think of it I've heard that a strange Vah Shir has occasionally been spotted heading towards the villages of the Coterie of the Eternal Night here in the Tenebrous Mountains. This may be the Vah Shir you are seeking. I will be sure to question any arriving travelers if they have spotted him.");
        e.other:Faction(206,3); -- Magus Conlegium
        e.other:Faction(168,1); -- Katta Castellum Citizens
        e.other:Faction(350,1); -- Validus Custodus
        e.other:Faction(228,-1); -- Nathyn Illuminious
        e.other:Faction(55,-1); -- Coterie of the Eternal Night
        e.other:Faction(284,-1); -- Seru
        e.other:Faction(139,-1); -- Hand of Seru
        e.other:Faction(96,-1); -- Eye of Seru
        e.other:Faction(138,-1); -- Hand Legionnaries
        eq.unique_spawn(172186,0.0,0,-1414,-1265,-38,0); -- Kerzar Clawtore
        e.other:QuestReward(e.self,0,0,0,0,0,50000); -- exp
    end
    item_lib.return_items(e.self, e.other, e.trade)
end
