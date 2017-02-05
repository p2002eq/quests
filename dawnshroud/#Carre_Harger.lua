---- Quest:Hunter's Pike
function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 31781})) then -- Note to Carre
        e.self:Say("There's been four wolves that have been ravaging the forest. We need them killed. When you are done bring me back their pelts. I know one to be bloodthristy, while the other is enraged. The other two I haven't even seen. But I can hear 'em.");
        eq.spawn2(174350,0,0,e.self:GetX() +5,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- An_Enraged_Beast
        eq.spawn2(174349,0,0,e.self:GetX() -5,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- A_ravenous_beast
        e.other:QuestReward(e.self,0,0,0,0,0,500); -- EXP
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 31783, item2 = 31784, item3 = 31785, item4 = 31786})) then -- A Ravenous Wolfs Pelt, A Bloodthirsty Wolfs Pelt, A Rabid Wolfs Pelt & An Enraged Wolfs Pelt
        e.self:Say("I'm still in shock. I can't believe those pesky wolves are finally gone. Bring this note to Wils, he should have something for you.");
        e.other:QuestReward(e.self,0,0,0,0,31782,1000); -- Note to Wils
        eq.depop();
    end
    item_lib.return_items(e.self, e.other, e.trade)
end