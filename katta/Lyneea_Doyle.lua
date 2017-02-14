function event_spawn(e)
    eq.set_timer("lyneea", 60000);
end

function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Greetings! You look like a healthy " .. e.other:Race() .. ". We should play a game of coppers some time! You wouldn't be afraid to drink against a woman would ya?");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
    if (e.timer == "lyneea") then
        e.self:Say("You ready for some coppers Olam? I've got a fresh mug of Loyalist Ale waitin ta be drunk!");
        eq.signal(160223,1,8000); -- Olam Polaja
    end
    eq.stop_timer(e.timer)
end

function event_signal(e)
    if(e.signal == 1) then
        e.self:Emote("attempts to flip a copper into a mug on the table and misses!");
        eq.signal(160223,2,8000); -- Olam Polaja
    elseif(e.signal == 2) then
        e.self:Emote("attempts to flip a copper into a mug on the table and succeeds!");
        eq.signal(160223,3,8000); -- Olam Polaja
    elseif(e.signal == 3) then
        eq.signal(160223,4,8000); -- Olam Polaja
    elseif(e.signal == 4) then
        e.self:Emote("drinks a gulp of ale");
        eq.signal(160223,5,100); -- Olam Polaja
    elseif(e.signal == 5) then
        e.self:Emote("attempts to flip a copper into a mug on the table and succeeds!");
        eq.signal(160223,6,8000); -- Olam Polaja
    elseif(e.signal == 6) then
        eq.signal(160223,7,8000); -- Olam Polaja
    elseif(e.signal == 7) then
        e.self:Emote("attempts to flip a copper into a mug on the table and succeeds!");
        eq.signal(160223,8,8000); -- Olam Polaja
    elseif(e.signal == 8) then
        e.self:Say("Are you feeling all right?");
        eq.signal(160223,9,8000); -- Olam Polaja
    elseif(e.signal == 9) then
        e.self:Say("You never can hold your liquor Olam!");
        eq.set_timer("lyneea", 540000);
    end
end