-- Taskmaster Revan`Kezh (162060) for Cursed cycle

function event_death_complete(e)
	eq.zone_emote(1, 'Revan dead');
	eq.signal(162266, 8);
end
