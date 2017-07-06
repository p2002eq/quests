--Rissa
--zone: Plane of Mischief 1.0

--Script to control NPC dialogues while running

function event_spawn(e)
	e.self:SetRunning(true);
end

function event_waypoint_arrive(e)
	if (e.wp == 0) then			--reflects waypoint where Rissa pauses at water
		eq.stop_timer("phrases");
		e.self:Say("Oooooooh! Look Bizzznawa! Pretty water. Pretty. Let's play more!");
	elseif (e.wp == 15) then		--reflects waypoint where Rissa pauses at water
		eq.stop_timer("phrases");
		e.self:Say("Oooooooh! Look Bizzznawa! Pretty water. Pretty. Let's play more!");
	end
end

function event_waypoint_depart(e)
	if (e.wp == 0) then 
		eq.set_timer("phrases",30*1000);  -- restart timer
	elseif (e.wp == 15) then
		eq.set_timer("phrases",30*1000);  -- restart timer
	end
end
		
function event_timer(e)
	if (e.timer == "phrases") then
		local rant = math.random (1,7);  -- 7 different dialog choices
		if (rant == 1) then
			e.self:Say("Ahhhhhh! Someone help me! This crazy Bixie is chasing me!");
		elseif (rant == 2) then
			e.self:Say("Won't anyone help me! Ahhh!");
		elseif (rant == 3) then
			e.self:Say("Blast it all! No help! No help from anyone I see! AHHHHHH!");
		elseif (rant == 4) then
			e.self:Say("NO NO NO NO! I can keep running! You will not catch me you crazed Bixie!");
		elseif (rant == 5) then
			e.self:Say("These legs will carry me to salvation! Someone get this Bixie off me!");
		elseif (rant == 6) then
			e.self:Say("Maybe if it rains, her wings will be wet and I can get her!");
		elseif (rant == 7) then
			e.self:Say("Its almost got me! Someone help!");
		end
	end
end

function event_combat(e)
    if (e.joined == false) then
        eq.set_timer("phrases",45*1000);  --45 sec recast on starting dialogue
    else
		eq.stop_timer("phrases");
    end
end


