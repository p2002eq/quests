--NPC:	Ghost_of_Burdael
--Zone:	crystal (Crystal Caverns)

--Triggered Mob as Part 3.0 of Spirit of Garzicor Quest:  http://everquest.allakhazam.com/db/quest.html?quest=1277

function event_spawn(e)
	eq.set_timer("depop",10*60*1000);		--10 min depop
end

function event_combat(e)
	if (e.joined) then
		eq.stop_timer("depop");
	else
		eq.set_timer("depop", 10*60*1000);	--reset 10 min depop timer once leaving combat
	end
end

function event_timer(e)
	if (e.timer == "depop") then
		eq.depop();
	end
end