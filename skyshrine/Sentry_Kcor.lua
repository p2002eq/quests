-- Storm Giant Toes to Sentry Kcor
function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Halt who goes there? Hmmm. What manner of strangers are you? Let it be known the Kin hold no love for outsiders, only the truly worthy may walk amongst the Kin.");
        eq.signal(114566,1,2000); -- Sentry_Enots
    elseif (e.other:GetFaction(e.self) < 4) then -- Less than amiable
        e.self:Say("Be quick for the Guardians may not appreciate you leaving your post.");
    end
end
function event_trade(e)
    local helms = 0;
    local mercAssigments = 0;
    local item_lib = require("items");
    if (item_lib.check_turn_in(e.self, e.trade, {item1 = 29062, item2 = 29062, item3 = 29062, item4 = 29062})) then --Giant Helms
        helms = 4;
    elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 29062, item2 = 29062, item3 = 29062})) then --Giant Helms
        helms = 3;
    elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 29062, item2 = 29062})) then --Giant Helms
        helms = 2;
    elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 29062})) then --Giant Helms
        helms = 1;
    end

    if (helms > 0) then
        repeat
        e.self:Say("Very good, you are on your way to proving yourself.");
        e.other:Faction(42, 15); --CoV
        e.other:Faction(362, 3); --Yelinak
        e.other:Faction(189, -7); --Kromzek
        helms = helms - 1;
        until helms == 0
    end

    if (item_lib.check_turn_in(e.self, e.trade, {item1 = 29624, item2 = 29624, item3 = 29624, item4 =29624})) then --Merc Assignments
        mercAssigments = 4;
    elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 29624, item2 = 29624, item3 = 29624})) then --Merc Assignments
        mercAssigments = 3;
    elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 29624, item2 = 29624})) then --Merc Assignments
        mercAssigments = 2;
    elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 29624})) then --Merc Assignments
        mercAssigments = 1;
    end

    if (mercAssigments > 0) then
        repeat
        e.self:Say("Ahhh yes! Well done " .. e.other:Class() .. ". Here is your reward. Your status with our people grows with each interloper you eradicate.");
        e.other:GiveCash(math.random(20), math.random(10), math.random(10), 0); -- petty cash
        e.other:Faction(42, 15); --CoV
        e.other:Faction(362, 3); --Yelinak
        e.other:Faction(189, -7); --Kromzek
        mercAssigments = mercAssigments - 1;
        until mercAssigments == 0
    end

    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29124}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 29125})) then	--Storm giant or Frost giant toes
        e.self:Say("Ahh these will go nicely with the rest of my collection. Here is a small reward for your trouble.");
        e.other:Faction(42, 10); -- CoV
        e.other:Faction(362, 2); -- Yelinak
        e.other:Faction(189, -2); -- Kromzek
        e.other:QuestReward(e.self,4,1,2,0,0,10000); -- Faction and EXP
    end
    item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
    if(e.signal == 1) then
        e.self:Say("Perhaps, but then again these strangers may be worthy of our trust unlike that vile Kragen Morshire, perhaps we should give them a chance to prove themselves truly worthy to walk amongst the Kin.");
        eq.signal(114566,2,2000); -- Sentry_Enots
    elseif(e.signal == 2) then
        e.self:Say("Very well Enots, but do not be long, Lord Yelinak would have your hide should invaders arrive while you are not at your post.");
        eq.signal(114566,3,2000); -- Sentry_Enots
    end
end