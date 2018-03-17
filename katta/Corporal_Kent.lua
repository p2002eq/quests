---- Quest:Shrieking Substances
function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Say("Ho there, who are you? Are you [" .. eq.say_link("reporting for duty") .. "] or just annoying me?");
    elseif(e.message:findi("reporting for duty")) then
        e.self:Say("Outstanding, now tuck in that tunic. We are trying out some new Shadowscream armor from Barkhem, the smith in Shar Vahl, and some of his students. They will cut us a nice deal if we deliver some of the supplies, so go fill this up with shrieking substances for me. What are you staring at? Go!! And suck in that gut!");
        e.other:SummonItem(17497); -- Sonic Receptacle
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29842})) then -- Full Sonic Receptacle
        e.self:Say("Well done, " .. e.other:GetName() .. ", this should really help keep our costs down. Here, take these, and keep up the good work. Dismissed!");
        e.other:Faction(350,10); -- Validus Custodus
        e.other:Faction(168,10); -- Katta Castellum Citizens
        e.other:Faction(206,10); -- Magus Conlegium
        e.other:Faction(228,-10); -- Nathyn Illuminious
        e.other:Faction(55,-10); -- Coterie of the Eternal Night
        e.other:Faction(96,-10); -- Eye of Seru
        e.other:Faction(138,-10); -- Hand Legionnaries
        e.other:Faction(139,-10); -- Hand of Seru
        e.other:Faction(284,-10); -- Seru
        e.other:SummonItem(eq.ChooseRandom(10664, 10668, 10663, 10665)); -- Combine Throwing Spear, Validus Custodus Flight Arrow, Combine Throwing Knife or Combine Shuriken
        e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(10664, 10668, 10663, 10665),1000); -- Combine Throwing Spear, Validus Custodus Flight Arrow, Combine Throwing Knife or Combine Shuriken
    end
    item_lib.return_items(e.self, e.other, e.trade)
end