--#Askr_the_Lost (209151)
--Version that spawns after Agnarr the Storm Lord's death
--bothunder

local dialogue = false;

function event_spawn(e)
	dialogue = false
end

function event_waypoint_arrive(e)
	if e.wp == 10 then
		e.self:SetRunning(true);
	elseif e.wp == 11 and not dialogue then
		e.self:Shout("Rainkeeper!");
		eq.signal(209142,1,2*1000);	--#Karana (209142)
		dialogue = true;
	end
end

function event_signal(e)
	if e.signal == 1 then
		e.self:Say("Many months Rainkeeper, the giants have destroyed the towers of the Bastion while you have slept. I have failed you, your trust in me has been misplaced. Much of the plane outside lies in ruins from the uncontrolled rage of the storm that my weakness allowed to happen.");
		eq.signal(209142,2,12*1000);	--#Karana (209142)
	elseif e.signal == 2 then
		e.self:Say("The Fallen?");
		eq.set_timer("depop", 30 * 1000);
	end
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end