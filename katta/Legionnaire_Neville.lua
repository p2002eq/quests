function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Emote("coughs a bit and looks up at you with tired, bleary eyes,");
        e.self:Say("Ugh, I have not had such a cold as this since I was a boy. I have heard of a [tea-maker] in the city of the Vah Shir that makes a stamina enhancing tea. I would like to try some and see if it might help.");
    elseif(e.message:findi("tea maker")) then
        e.self:Say("ACHOO! Excuse me. It was some kind of root tea... saucy greyroot... sparkly greenroot... something like that I think. The brewer's name was... Adam... Lama... Oh I just cannot think straight.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 31772})) then -- Spiced Grimroot Tea
        e.self:Say("Thanks! " .. e.other:GetName() .. ", I hope this does the trick.");
        e.other:Faction(350,10); -- Validus Custodus
        e.other:Faction(168,10); -- Katta Castellum Citizens
        e.other:Faction(206,10); -- Magus Conlegium
        e.other:Faction(228,-10); -- Nathyn Illuminious
        e.other:Faction(55,-10); -- Coterie of the Eternal Night
        e.other:Faction(96,-10); -- Eye of Seru
        e.other:Faction(138,-10); -- Hand Legionnaries
        e.other:Faction(139,-10); -- Hand of Seru
        e.other:Faction(284,-10); -- Seru
        e.other:QuestReward(e.self,0,0,0,0,31775,2000); -- Jabbars seal
    end
    item_lib.return_items(e.self, e.other, e.trade)
end
