-- Draz_Nurakk (157131) for BST epic

function event_spawn(e)
	eq.set_timer('depop', 60 * 60 * 1000) -- 60 minute depop timer
end

function event_timer(e)
	eq.stop_timer(e.timer)
	if e.timer == 'depop' then
		eq.depop()
	elseif e.timer == 'pet' then
		 eq.get_entity_list():GetMobByNpcTypeID(157140):AddToHateList(e.self:GetTarget(), 1);
	end
end

function event_hate_list(e)
	if e.joined and eq.get_entity_list():IsMobSpawnedByNpcTypeID(157140) then
		e.self:Say("Aid me, my pet!");
		eq.set_timer('pet', 1000);
	end
end
