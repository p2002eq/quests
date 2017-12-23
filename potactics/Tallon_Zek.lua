local x_max = -445;
local x_min = -770;
local y_max = -1761;
local y_min = -2158;
local z_const = 207.7;

function event_combat(e)
	if e.joined then
		eq.set_timer("shadowstep", 20*1000);
		eq.stop_timer("reset");
	else 
		eq.stop_timer("shadowstep");
		eq.set_timer("reset", 30*1000);
	end
end

function event_timer(e)
	if e.timer == "shadowstep"	then
		--local new_x = int(rand(1) * ( x_max -  x_min + 1)) +  x_min;
		--local new_y = int(rand(1) * ( y_max -  y_min + 1)) +  y_min;
		local new_x = (math.random(0,1) * (x_max -  x_min + 1)) +  x_min;
		local new_y = (math.random(0,1) * ( y_max -  y_min + 1)) +  y_min;
		local new_z =  z_const;
		e.self:Emote("steps into the shadows.");
		e.self:GMMove(new_x, new_y, new_z);
	elseif e.timer == "reset" then
		eq.stop_timer(e.timer);
		e.self:GMMove(-620, -1959, 207.7);
	end
end

function event_death_complete(e)
	  eq.stop_timer("shadowstep");
	  eq.spawn2(218068,0,0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
end