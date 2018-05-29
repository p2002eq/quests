--A_Pile_of_Boulders (218030)
--Stone Ring Trigger
--poeartha

function event_death_complete(e)	
	eq.signal(218036,1);	--stone_controller (218036)
end
