function event_spawn()
    eq.settimer(1,300000);
    e.self:Say("Thank you, ".. e.other:GetName() .. ". I am not long for this world. Before I leave, I would like to reward the one who helped me have my revenge. Please, hand me the token of my God, of Cazic-Thule, and I shall pass you the spear I once used. You've earned it."); -- Adlib
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 2297})) then -- Idol of Fear
        e.self:Emote("takes the idol into his spectral hand and shoves the lance into your arms. After letting go of the lance, the ghost immediately begins to fade away. Before it is gone completely, it looks into your eyes and says, 'Suffer.'");
        e.other:QuestReward(e.self,0,0,0,0,2099,100);  -- Soulfiend Lance
        eq.stoptimer(1);
        eq.depop();
    end
    item_lib.return_items(e.self, e.other, e.trade);
end

function event_timer()
    eq.stoptimer(1);
    eq.depop();
end