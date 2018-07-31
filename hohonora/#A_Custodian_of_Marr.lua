--#A_Custodian_of_Marr (211114 & 211115)
--Event trigger NPCS for Alekson Garn and Rhaliq Trell Trials 
--hohonora

function event_spawn(e)
	eq.set_timer("depop",2*60*60*1000);	--2hr timer
end

function event_timer(e)
	if(e.timer == "depop") then
		eq.depop();
	end
end
