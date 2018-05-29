--#Xegony_the_Queen_of_Air (215056)
--loads encounter upon entering combat
--poair


function event_combat(e)
	if e.joined then
		eq.signal(215436,1);	--#event_control_Xegony (215436)
	end
end
