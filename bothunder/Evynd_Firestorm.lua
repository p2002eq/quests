--Evynd_Firestorm (209054)
--zone: bothunder

function event_combat(e)
	if e.joined then
		eq.set_timer("storms", 30 * 1000);
	end
end

function event_timer(e)
	if e.timer == "storms" then
		if e.self:IsEngaged() then
			eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()},7,500,"Evynd waves his hands in the air, calling the power of the firestorm through the blazing portals.");
			eq.signal(209122,1); --signal adds to spawn via A_firestorm_portal (209122)
			eq.stop_timer(e.timer);
			eq.set_timer("storms",2*60*1000);
		else
			eq.stop_timer(e.timer);
		end
	end
end


function event_death_complete(e)
	eq.spawn2(209153,0,0,-1117,-1733,1270,128);	--#Askr_the_Lost_ (209153)
	eq.signal(209160,1);	--signal #torden_control (209160) to depop and start respawn timer
end
