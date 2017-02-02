---- Quest:Vampyre Troubles
function event_say(e)
    if(e.message:findi("valdanov zefeer") and tonumber(qglobals.first_badge_nathyn) == 1) then
        e.self:Say("Valdanov Zevfeer was a talented alchemist from Shadow Haven with whom I had many dealings. He would bring me components for my enchantment research from all the various environments here on Luclin. Since Valdanov had been such a valuable aid to me in the past I decided to return the favor and allowed him residence within my abode and helped to further fund his research as long as he assisted me in my own enchantment studies. He has since left to continue to pursue his own interests and I have not heard from him in [quite some time].");
    elseif(e.message:findi("quite some time") and tonumber(qglobals.first_badge_nathyn) == 1) then
        e.self:Say("Valdanov departed many years ago. He had become dangerously obsessive with his research of vampyre physiology and the effects of various alchemical formulae on the undead creatures. His obsession began when a traveler arrived in Katta Castellum speaking of a Vah Shir vampyre. Valdanov began leaving the safety of the city frequently in search of this undead Vah Shir and for questionable alchemical reagents with which he insisted on testing on [captured vampyres] being studied by the Magus Conlegium.");
    elseif(e.message:findi("captured vampyres") and tonumber(qglobals.first_badge_nathyn) == 1) then
        e.self:Say("After an unfortunate mishap with an escaped vampyre in the city the Magus Conlegium and the Validus Custodus declared that no vampyres shall ever again enter the city of Katta Castellum and only their ashes or blood may be studied under the careful observation of the Magus Conlegium. I am very sorry but I have some pressing business I must attend to and I'm afraid I have nothing more to offer. You may take this information back to Magistrate Phenic as he has requested.");
        e.other:SummonItem(31755); -- Report of Nathyns Questioning
        eq.set_global("first_badge_nathyn","0",0,"F");
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 31752})) then -- Katta Castellum Badge of Service (*Katta Castellum Badge of Service)
        e.self:Say("Ahh i see you're assisting Phenic. Perhaps looking into more information on [Valdanov Zefeer]?");
        eq.set_global("first_badge_nathyn","1",0,"F");
        e.other:QuestReward(e.self,0,0,0,0,31754,20000); -- Katta Castellum Badge of Service (*Second Badge of Service)
    end
    item_lib.return_items(e.self, e.other, e.trade)
end