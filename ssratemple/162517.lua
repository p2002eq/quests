-- #Arch Lich Rhag`Zadune (162517) 

function event_death_complete(e)
	eq.set_global("AL_Cycle","COMPLETE",3,"D4");  --sets global to close out cycle
end
