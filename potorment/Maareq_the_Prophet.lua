local spawn = 0;

function event_spawn(e)
	spawn = 0;
end

function event_combat(e)
	eq.set_timer("adds", 30 * 1000);
	eq.set_timer("reset", 30 * 60 * 1000); --30 min
	eq.set_next_hp_event(15);
end

function event_timer(e)
	if e.timer == "adds" and spawn <= 5 then
		eq.ChooseRandom((eq.spawn2(207069,0,0,-32,-95,452,68)),(eq.spawn2(207069,0,0,-32,-135,452,0)),(eq.spawn2(207069,0,0,44,-50,452,0)),(eq.spawn2(207069,0,0,0,-52,452,0)),(eq.spawn2(207069,0,0,-25,-116,460,0)));
		spawn=spawn+1;
	elseif e.timer == "reset" then
		spawn = 0;
		eq.stop_all_timers();
	end
end


function event_hp(e)
	if e.hp_event == 15 then
		eq.depop_with_timer();
		--set maareq's respawn, without this line he will repop on zone reset
		--commented this out and put it in death event of the #a_twisted_crawler
		--only to allow a failed raid to redo the event without putting in smarter
		--logic to keep the #a_twisted_crawler up through a zone reset/empty.
		--eq.updatespawntimer(42165,43200000);
		eq.spawn2(207070,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.stop_all_timers();
	end
end