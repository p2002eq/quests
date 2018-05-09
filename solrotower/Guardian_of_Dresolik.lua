--Guardian_of_Dresolik (212046)
--signals #dresolik_trigger to check if Protector can spawn

function event_death_complete(e)
	eq.signal(212062,1);	----#dresolik_trigger (212062)
end