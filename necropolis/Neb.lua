function event_say(e)

    if (e.message:findi("hail")) then
        eq.signal(123105,99,1000);
    elseif (e.message:findi("chetari")) then
        e.self:Say("Rika sa vi na Chetari aga val rak Zlandicar. The Chetari are an evil breed, shaped by Zlandicar. Asila sa vi ne Paebala ika so takina. They enslave the Paebala. Canti ri va ni makata ra Paebala. The Paebala revolted years ago. Mishi ro ka rilla vi ne graka sal ogoo mashan rina, villi rassa rassa ke! They are powerful in the ways of death, but they fear our goo friends, and our teeth are sharp! Rika re rika so malti fe isha kora, Chetari fa rish na Paebala. But the Chetari will not rest until we are all dead or slaves. Villi rassa rassa ke, korta ne riki sa vena. Our teeth are sharp, but we can not win. Wilta fa unala kisha Zlandicar maka re, villa rasssa, moa Chetari isa rolak. Zlandicar has the sharpest teeth, and the Chetari do his bidding.");
    end

end

function event_signal(e)
    if e.signal == 101 then
        e.self:Say("Chika val na vi Paebala Neb'ri. I am Neb of the Paebala. Aknila sa rik nor valkuta aknila. Start no trouble, there will be no trouble. Nish ala ro tak na re Chetari, skas vena ral. Avoid the Chetari, they will kill you.");
    end

end

function event_trade(e)
    local item_lib = require('items');

    if (item_lib.check_turn_in(e.self, e.trade, {item1 = 26033, item2 = 26009})) then
        e.self:Say("Ika Paebala ma ri skasha, Neb`ri mi re skashi! The Paebala are joyful, Neb is joyful! Misu na tona Vaniki esa Zlandicar, no re Paebala soka mora Chetari, ika tu. With the death of Vaniki and Zlandicar, the Paebala can conquer the Chetari, and rule! Mika na so kaka rika, ug boro Neb`ri, ek val Vaniki ushta. Take this, it is Neb's fighting bone, and here, this key I took from Vaniki.");
        e.other:SummonItem(26040);
        e.other:SummonItem(28060);
        e.other:AddEXP(250000);
        e.other:Faction(244, 50);
        e.other:Faction(32, -150);
        e.other:Faction(365, -150);
    end

    item_lib.return_items(e.self, e.other, e.trade);    

end
