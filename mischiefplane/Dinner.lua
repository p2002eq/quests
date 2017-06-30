--LUA script for Dinner to lay down on table upon spawn.  Setting the spawn condition to laying down animation did not seem to always work

function event_spawn(e)
	eq.set_timer("laydown",1*1000); --1 sec delay
end

function event_timer(e)
	if (e.timer == "laydown") then
		e.self:SetAppearance(3);  --set appearance to lay down on table. 
		eq.stop_timer("laydown");
	end
end