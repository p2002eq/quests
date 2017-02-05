function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Greetings stranger. A word of advice if I may. Don't get yourself suckered into a game of coppers with this woman. she has an iron gullet!");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
    if(e.signal == 1) then
        e.self:Say("All right you begin, I am going to beat you this time!");
        eq.signal(160219,1,8000); -- Lyneea Doyle
    elseif(e.signal == 2) then
        e.self:Emote("attempts to flip a copper into a mug on the table and misses!");
        eq.signal(160219,2,8000); -- Lyneea Doyle
    elseif(e.signal == 3) then
        e.self:Emote("drinks a gulp of ale 'Nice toss!'");
        eq.signal(160219,3,100); -- Lyneea Doyle
    elseif(e.signal == 4) then
        e.self:Emote("attempts to flip a copper into a mug on the table and succeeds!");
        eq.signal(160219,4,8000); -- Lyneea Doyle
    elseif(e.signal == 5) then
        eq.signal(160219,5,8000); -- Lyneea Doyle
    elseif(e.signal == 6) then
        e.self:Emote("drinks a gulp of ale 'Nice toss!'");
        eq.signal(160219,6,8000); -- Lyneea Doyle
    elseif(e.signal == 7) then
        e.self:Emote("attempts to flip a copper into a mug on the table and misses!");
        eq.signal(160219,7,8000); -- Lyneea Doyle
    elseif(e.signal == 8) then
        e.self:Emote("takes another gulp of ale and begins to look dizzy");
        eq.signal(160219,8,8000); -- Lyneea Doyle
    elseif(e.signal == 9) then
        e.self:Say("I'll...be...fine....uhn..");
        e.self:SetAppearance(3);
        e.self:SetAppearance(0);
        eq.signal(160257,1,8000); -- Lyneea Doyle
    end
end