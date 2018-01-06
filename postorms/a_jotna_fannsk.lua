--a_jotna_fannsk (210035) & a_jotna_fannsk (210407)
--Desert Giant Fort
--Notifies #Gurebk,_Lord_of_Krendic (210472) that npc was killed in the camp.
--postorms

function event_death_complete(e)
	eq.signal(210472,0);	--#Gurebk,_Lord_of_Krendic (210472)
end