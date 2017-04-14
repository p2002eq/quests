---- Quest:Johanius Stake of Slaying

function event_spawn(e)
    e.self:Say("Who is the most fearless [vampyre slayer] of your fellowship?");
    eq.set_timer("jbts", 300 * 1000);
end

function event_say(e)
    fac = e.other:GetFaction(e.self);
    if(e.message:findi("vampyre slayer") and (fac < 6)) then
        e.self:Emote("hands " .. e.other:GetName() .. " his bloodied stake and rifles through his backpack. 'Here, hand me back my stake and you can have this brand new one that has been enchanted by the Praecantors of the Magus Conlegium.'");
        e.other:QuestReward(e.self,0,0,0,0,2690,1000); -- Blood Crusted Stake
    end
end

function event_timer(e)
    eq.stop_timer(e.timer)
    if (e.timer == "jbts") then
        eq.depop();
    end
end

function event_trade(e)
    local item_lib = require("items");
    
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 2690})) then -- Blood Crusted Stake
        e.self:Say("On behalf of the citizens of Katta Castellum I extend our gratitude for your assistance in our war with the Coterie of the Eternal Night!");
        e.other:QuestReward(e.self,0,0,0,0,2689,500); -- Johanius Stake of Slaying
        eq.depop();
    end
    
    item_lib.return_items(e.self, e.other, e.trade)
end