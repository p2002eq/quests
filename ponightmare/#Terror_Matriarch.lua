--#Terror_Matriarch (204034)
--ponightmare

function event_spawn(e)
	eq.set_next_hp_event(98);
end

function event_hp(e)
	if e.hp_event == 98 then
		eq.set_next_inc_hp_event(99);
		eq.set_timer("spawn",1);
	end
	
	if e.inc_hp_event == 99 then
		eq.set_next_hp_event(98);
	end
end
		
function event_timer(e)
	if e.timer == "spawn" then
		eq.stop_timer(e.timer);
		if e.self:IsEngaged() then
			eq.set_timer("spawn", 30 * 1000);	-- 30 second spawn timer for adds
			
			local spawned = eq.spawn2(204466, 0, 0, e.self:GetX() + math.random(-5,5), e.self:GetY() + math.random(-5,5), e.self:GetZ(), e.self:GetHeading()); -- an_abhorrent_hatchling
			eq.set_timer('depop', 5 * 60 * 1000, spawned);
		end
	end
end