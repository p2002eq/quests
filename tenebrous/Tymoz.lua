---- Quest:Custodus Helms
function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("So " .. e.other:Race() .. ", you dare to stand before the mighty Tymoz?  I am the Governor of this village of the Coterie of the Eternal Night.  Do you wish to [assist the Coterie], or will you better serve us as sustenance for our eternal lives?");
    elseif(e.message:findi("assist the Coterie")) then
        e.self:Say("You have made an intelligent decision my friend.  Our primary foe is the meddling Validus Custodus, the militia of Katta Castellum.  I will reward you for every two damaged custodus legionnaire helms or two damaged custodus centurion helms that you present to me as proof that you have slain members of our enemies ranks.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 31748, item2 = 31748})) then -- 2x Damaged Custodus Legionnaire Helm
        e.self:Say("Excellent! Two less of thos self righteous Validus Custodus goons to worry about!");
        e.other:Faction(55, 1); -- Coterie of Eternal Night
        e.other:Faction(349, 1); -- Valdanov Zevfeer
        e.other:Faction(228, -1); -- Nathyn Illuminious
        e.other:Faction(350, -1); -- Validus Custodus
        e.other:SummonItem(eq.ChooseRandom(1001,0,0)); -- 33% Chance - Blood Dipped Dart
        e.other:SummonItem(eq.ChooseRandom(1001,0,0)); -- 33% Chance - Blood Dipped Dart
        e.other:QuestReward(e.self,0,0,0,0,31750,5000); -- Blood Dipped Dart
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 31749, item2 = 31749})) then -- 2x Damaged Custodus Centurion Helm
        e.self:Say("Excellent! Two less of thos self righteous Validus Custodus goons to worry about!");
        e.other:Faction(55, 1); -- Coterie of Eternal Night
        e.other:Faction(349, 1); -- Valdanov Zevfeer
        e.other:Faction(228, -1); -- Nathyn Illuminious
        e.other:Faction(350, -1); -- Validus Custodus
        e.other:QuestReward(e.self,0,0,0,0,31833,5000); -- Potent Vitae
    end
    item_lib.return_items(e.self, e.other, e.trade)
end