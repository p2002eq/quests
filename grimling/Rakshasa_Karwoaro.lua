---- Quest:Rakshasa Skulls
function event_spawn(e)
    eq.set_timer("Rakshasa", 900000); -- 15 minutes to kill
    e.self:Shout("Hahahaha. You can not defeat that which is not of this realm of existence! I shall slay your feeble meat shells for your audacity of summoning me here!");
    eq.attack(qglobals.Rakshasa_combat); -- Attack Trigger PC
end

function event_death_complete(e)
    e.self:Say("I shall have my revenge! I swear it!!");
    eq.set_global("Rakshasa","1",2,"M30"); -- 30 Minute Event Cooldown
end

function event_timer(e)
    if (e.timer == "Rakshasa") then
        e.self:Say("You have failed!"); -- Adlib
        eq.depop();
        eq.set_global("Rakshasa","1",2,"M30"); -- 30 Minute Event Cooldown
    end
    eq.stop_timer(e.timer)
end