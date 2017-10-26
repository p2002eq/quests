-- a_furious_apprentice in Acrylia for WitchDoctor Ring
--NPC ID: 154123

function event_death_complete(e)
	eq.signal(154404,10);	--signal witchdocter trigger
end
