--a_confused_air_elemental (215012)
--Trigger mobs for Elemental Masterpiece Event
--poair

function event_death_complete(e)
	eq.signal(215426,1);	--#isle_three_controller (215426)
end