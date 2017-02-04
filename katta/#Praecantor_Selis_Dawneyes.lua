---- Quest:Vampyre Troubles
function event_spawn(e)
    eq.set_timer("Selis", 900000);
end

function event_timer(e)
    if (e.timer == "Selis") then
        eq.depop();
    end
    eq.stop_timer(e.timer)
end

function event_signal(e)
    if(e.signal == 1) then
        e.self:Say("So it seems you are aware of the outcome of his hidden experimentation. Care to enlighten us as to what that outcome was?");
        eq.signal(160482,3,15000); -- Autarkic Lord Sfarosh
    elseif(e.signal == 2) then
        e.self:Say("Ajeea! What's happened?! I sense there are dark powers at work here!");
        eq.signal(160484,2,15000); -- #Incantator Jak Masric
    elseif(e.signal == 3) then
        e.self:Say("rushes to Ajeea, lifts her comotose body with a magical force and they both vanish in a flash of light.");
        eq.signal(160485,3,10000); -- #Theurgus Ajeea Polaja
    end
end