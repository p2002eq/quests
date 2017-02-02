---- Quest:Vampyre Troubles
function event_spawn(e)
    eq.set_timer("Masric", 900000);
end

function event_timer(e)
    if (e.timer == "Masric") then
        eq.depop();
    end
    eq.stop_timer(e.timer)
end

function event_signal(e)
    if(e.signal == 1) then
        e.self:Say("We neither fear you nor seek to be drawn into your dark ways, Lord Sfarosh. You will provide us some information as demanded by the Magistrates of the Loyalist Empire. The questions are simple, answer quickly and the sooner you shall be freed from this summoning. What is your history with the alchemist Valdanov Zevfeer?");
        eq.signal(160482,2,5000); -- Autarkic Lord Sfarosh
    elseif(e.signal == 2) then
        e.self:Say("The circle of containment is breaking down without Ajeea! Prepare yourselves!");
        eq.signal(160482,5,5000); -- Autarkic Lord Sfarosh
    elseif(e.signal == 3) then
        e.self:Say("Eliminate the shades! Selis and I will get Ajeea to safety and concentrate on a ward to prevent any further intrusion and stifle the shades power! Seek me out and bring me the robes of these shades when they have been slain so that we may research placing a more permanent ward against such creatures on the Conlegium.");
        eq.signal(160482,6,5000); -- Autarkic Lord Sfarosh
    end
end