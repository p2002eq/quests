---- Quest:Coterie Mask of the Dead
function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("reetings mortal. The aura of death that surrounds you is the only reason you are not already a feast for my minions. Have you come to me as a sacrifice or are you offering your [services] to the Coterie of the Eternal Night?");
    elseif(e.message:findi("services")) then
        e.self:Say("If you are powerful enough to be of use to me you will journey to the Twilight regions on the south side of Luclin and fill this wineskin with the blood of Akheva. Failure is final death, either at the hands of the Akheva or the hands of the Coterie.");
        e.other:SummonItem(17096); -- Empty Blood Skin
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10799})) then -- Skin of Akheva Blood
        e.self:Say("Well done, for a mortal you have served us well");
        e.other:Faction(55,5); -- Coterie of Eternal Night
        e.other:Faction(349,5); -- Valdanov Zevfeer
        e.other:Faction(228,-10); -- Nathyn Illuminious
        e.other:Faction(350,2); -- Validus Custodus
        e.other:QuestReward(e.self,0,0,0,0,7778,25000); -- Coterie Mask of the Dead
    end
    item_lib.return_items(e.self, e.other, e.trade)
end

function event_death_complete(e)
    eq.signal(172183,1);  -- signal for a chance to spawn Heratius Grolden
end