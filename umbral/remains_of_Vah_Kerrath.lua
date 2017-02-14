--- Quest:Talisman of the Vah Kerrath
function event_say(e)
    fac = e.other:GetFaction(e.self);
    if(e.message:findi("hail")) then
        e.self:Say("Fleshy mortal, can you not see that I am cursed to live in eternal anguish? What is it that you seek from me?");
    elseif(e.message:findi("worthy")) then
        if(fac <= 2) then
            e.self:Say("The squishy mortal has proven itself by releasing Elysian spirits. We greet the Elysian spirits to our realm and rejoice in their freedom. Go on fleshling, ask the bone man to tell you of Vex Thal.");
        else
            e.self:Say("Begone from my sight corruptor of spirits. I will only aid my allies.");
        end
    elseif(e.message:findi("vex thal")) then
        if(fac <= 2) then
            e.self:Say("The city of shadow is sealed by powerful magic. Only one that wears the talisman of Akelha Ra can pass through the seals on the gate. I have not been beyond the gates but rumors of dark prophets that possess great power have been heard throughout the ages.");
        else
            e.self:Say("I will not reveal the secrets I have discovered so easily. Since I am unable to leave the protection of the whisperling circle, I will need you to aid me in releasing the Elysian spirits from their tormented states. Destroy their remains and release their spirits from the grip of the shadow curse. Return four of their skulls to me as proof of your deeds. Only then will I impart my discoveries to you.");
        end
    elseif(e.message:findi("dark prophets")) then
        if(fac <= 2) then
            e.self:Say("Only legends and rumors have circulated about the dark prophets in Vex Thal. I suspect that they are the reason for my eternally cursed state. If you could find someway to defeat the dark prophet leading those in Vex Thal and bring me back proof of the deed, I shall reward you with an ancient relic that I possess.");
        else
            e.self:Say("Begone from my sight corruptor of spirits. I will only aid my allies.");
        end
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 8365})) then -- Soul Essence of Aten Ha Ra
        e.self:Say("" .. e.other:GetName() .. ", you have done more than was ever expected. Take this and my blessing will be with you always.");
        e.other:QuestReward(e.self,0,0,0,0,8364,100000); -- Talisman of Vah Kerrath
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 28102, item2 = 28102, item3 = 28102, item4 = 28102})) then -- 4x Elysian Skull
        e.self:Say("You have done well. Clear your mind of all distractions and ask the whisperlings if you are worthy of my knowledge.");
        e.other:Faction(358,5); -- Whisperling
        e.other:Faction(3,-5);  -- Akheva
        e.other:QuestReward(e.self,0,0,0,0,0,10000); -- Faction and EXP
    end
    item_lib.return_items(e.self, e.other, e.trade)
end