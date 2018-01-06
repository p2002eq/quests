--a_Koka`Vor_Chieftain (210464)  (rare spawn loot version -- NOT EVENT VERSION)
--StormRider Trees
--Notifies #Ston_trigger (210479) that npc was killed in the camp.
--postorms

function event_death_complete(e)
	eq.signal(210479,0);	--#Ston_trigger (210479)
end