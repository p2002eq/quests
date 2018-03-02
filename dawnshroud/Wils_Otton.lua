---- Quest:Hunter's Pike
function event_say(e)
    if(e.message:findi("forest ravagers")) then
        e.self:Say("I can't believe Jon mentioned that to you. I'll deal with him myself. If you want to help us kill the forest ravagers then you must first find Carre Harger. Bring this note to him. He'll get you started.");
        e.other:SummonItem(31781); -- Note to Carre
        eq.spawn2(174346,0,0,1200,1500,e.self:GetZ(),e.self:GetHeading()) -- #Carre_Harger
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 31782})) then -- Note to Wils
        e.self:Say("We've been hunting those wolves for a long time now. They killed many of my men. I'm glad to see that they are gone. Take this Hunter's Pike and get some good use out of it.");
        e.other:QuestReward(e.self,0,0,0,0,32170,1000); -- Hunters Pike
    end
    item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
    if(e.signal == 1) then
        e.self:Say("Quiet yourself little brother!");
    end
end
