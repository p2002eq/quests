---- Quest:Rakshasa Skulls
function event_spawn(e)
    eq.set_timer("grim2_combat", 900000); -- 15 Minutes
    eq.attack(qglobals.grimling_combat); -- Attack Trigger PC
end

function event_timer(e)
    if (e.timer == "grim2_combat") then
        eq.depop();
    end
    eq.stop_timer(e.timer)
end