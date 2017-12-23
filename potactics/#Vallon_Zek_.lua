
function event_spawn(e)
	eq.set_timer("global", 1);
end

function event_death_complete(e)
	eq.stop_timer("despawn");
	eq.stop_timer(1);
	eq.signal(214123, 214111);	--Tell trigger that Vallon is dead
    eq.set_global("vallon","1",3,"H108");
end

function event_signal(e)
        eq.stop_timer("despawn");
        eq.stop_timer(1);
        eq.depop();
end

function event_timer(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	if e.timer == "global" and tonumber(qglobals.vallon) == 1 then	--we place the global depop here because if used under SPAWN the NPC leaves a ghost mob.
		eq.stop_timer("global");
		eq.depop();
	elseif e.timer == "global" and qglobals.vallon == nil then 
		eq.stop_timer("global");
		eq.set_timer("despawn", 45*60*1000);	--45 min to kill him
		eq.set_timer(1,1);
	elseif e.timer == "despawn" then
		eq.stop_timer("despawn");
		eq.stop_timer(1);
		eq.depop();
	elseif (e.timer == 1 and e.self:GetX() < 340 and e.self:GetY() < 80) then
		eq.pause(2700);
	end
end

--End of File  Zone: PoTactics  ID: 214111 -- #Vallon_Zek_ 
--Used in Rallos Zek event