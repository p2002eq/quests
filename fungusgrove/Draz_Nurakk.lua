-- Draz_Nurakk (157131) for BST epic

function event_spawn(e)
	eq.set_timer('depop', 60 * 60 * 1000) -- 60 minute depop timer
end

function event_timer(e)
	eq.stop_timer(e.timer)
	if e.timer == 'depop' then
		eq.depop()
	end
end

function event_combat(e)
	local entlist = eq.get_entity_list();
	if e.joined and entlist:IsMobSpawnedByNpcTypeID(157140) then
		e.self:Say("Aid me, my pet!");
		entlist:GetNPCByNPCTypeID(157140):AddToHateList(e.self:GetTarget(), 1);
	end
end
