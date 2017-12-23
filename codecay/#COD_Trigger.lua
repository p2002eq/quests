local hp;

function event_spawn(e)
	eq.set_timer("77", 1 * 1000);
	hp = 0;
end


function event_timer(e)
	eq.stop_timer("77");
	eq.set_timer("77",1*1000);
	if(e.timer == "77" and hp == 2) then
		eq.spawn2(200032,0,0,310,328,-71.5,125);
		hp = 0;
		eq.stop_timer("69");
	elseif(timer == "69") then
		hp = 0;
		eq.stop_timer(69);
	end
end

function event_signal(e)
	hp = hp + 1;
	eq.set_timer("69", 4*60*60*1000);
end



