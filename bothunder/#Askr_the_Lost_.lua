--#Askr_the_Lost_ (209153)
--Version that spawns after Evynd_Firestorm's death
--bothunder

function event_spawn(e)
	eq.set_timer("depop", 60 * 60 * 1000);
end

function event_say(e)
	local zone_id = eq.get_zone_id();
	local instance_id = eq.get_zone_instance_id();
	if e.message:findi("hail") then
		e.self:Say("Well done.  I did not believe you could have progressed so far, so quickly.  Evynd was one of Agnarr's greatest lieutenants; your victory could not have been easy.  I fear, however, that your task will only become more difficult from here.  With Evynd dead, I can now help you to ascend to the next level.  When you are ready, simply ask and I will [" .. eq.say_link("transport") .. "] you to the [" .. eq.say_link("next level of Torden") .. "], but make haste, I cannot stay here for long.");
	elseif e.message:findi("transport") then
		e.other:MovePCInstance(zone_id,instance_id,-820,-1725,1730,380); -- needs_heading_validation
	end
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end
