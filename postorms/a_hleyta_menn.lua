--a_hleyta_menn (210099)
--Ocean Giant Fort
--Notifies Jeplak_Lord_of_Srerendi that npc was killed in the camp.
--postorms

function event_death_complete(e)
	eq.signal(210403,0);	--Jeplak,_Lord_of_Srerendi (210403) fake version
	eq.signal(210471,0);	--#Jeplak,_Lord_of_Srerendi (210471) real version
end