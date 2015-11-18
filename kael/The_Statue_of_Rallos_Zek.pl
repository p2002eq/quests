# On death, spawns the Idol of Rallos Zek


function event_death_complete(e)
    e.self:Shout("Protect the Idol of Zek!");
	eq.spawn2(113627,0,0,1292,1267,-35,254.5); -- Idol of Rallos Zek
end

--sub EVENT_DEATH_COMPLETE {
--  quest::shout("Protect the Idol of Zek!");
-- quest::spawn2(113341,0,0,1289,1300,-90,254.5);
--}

--# Quest by mystic414

