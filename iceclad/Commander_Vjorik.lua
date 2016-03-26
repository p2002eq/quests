-- Ambush 1 shout for shawl 8

function event_signal(e)
    if (e.signal == 1) then
        e.self:Shout("The tracking wolves have found the Coldain! To the South West, Charge him!");
        eq.depop();
    elseif (e.signal == 2) then
        e.self:SetInvisible(1);
        e.self:Shout("turn off invis");
    end
end