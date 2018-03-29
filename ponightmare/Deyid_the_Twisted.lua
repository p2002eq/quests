--Deyid the Twisted
--ponightmare

--90% HP -- Spawn untargetable trees
--60% HP -- Trees move closer to deyid
--50% HP -- Trees move closer in
--40% HP -- 4 trees become targetable and attack


function event_spawn(e)
	eq.set_next_hp_event(90);
	eq.depop_all(204069);	--depop any treants if spawned
	eq.depop_all(204068);	--depop any treants if spawned
end

function event_hp(e)
	if e.hp_event == 90 then		--spawn trees
		eq.spawn2(204068,0,0,1125,1162,280,344);
		eq.spawn2(204068,0,0,1191,1033,280,392);
		eq.spawn2(204068,0,0,1071,920,280,474);
		eq.spawn2(204068,0,0,901,939,280,50);
		eq.spawn2(204068,0,0,843,999,283,92);
		eq.spawn2(204068,0,0,786,1160,282,152);
		eq.spawn2(204068,0,0,965,1256,282,262);
		eq.spawn2(204069,0,0,990,908,280,512);		--this version will activate and aggro later in event
		eq.spawn2(204069,0,0,808,1074,278,116);		--this version will activate and aggro later in event
		eq.spawn2(204069,0,0,1171,966,280,428);		--this version will activate and aggro later in event
		eq.spawn2(204069,0,0,1057,1211,281,280);	--this version will activate and aggro later in event
		eq.set_next_hp_event(60);
		eq.set_next_inc_hp_event(98); --to reset on event failure
	elseif e.hp_event == 60 then
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 7, 300, "A low groaning sound wells up out of the surrounding woods as the rustling of leaves indicate something sinister is manifesting");
		eq.signal(204068,2);	--trees inch closer
		eq.signal(204069,2);	
		eq.set_next_hp_event(50);		
	elseif e.hp_event == 50 then
		e.self:Emote("waves his branches about in agitation and the surrounding trees close in.");
		eq.signal(204068,2);	--trees inch closer
		eq.signal(204069,2);	
		eq.set_next_hp_event(40);
	elseif e.hp_event == 40 then
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 7, 300, "Several of the foreboding trees tear their roots from the ground and move in to aid Deyid.");
		eq.signal(204069,3);	--activate 4 tree adds
	end
	
	if e.inc_hp_event == 98 then
		eq.set_next_hp_event(61);
		eq.depop_all(204069);	--depop any treants if spawned
		eq.depop_all(204068);	--depop any treants if spawned
	end
end

function event_death_complete(e)
	eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 7, 300, "An eerie silence settles onto the forest as Deyid the Twisted slumps over, defeated");
	eq.signal(204047,1);  --signal Seilaen (event success - she depops)
	eq.signal(204068,1);	--depop untargetable trees (#corrupt_treant)
	eq.signal(204069,1);	--signal depop timer start for targetable trees (corrupt_treant)
end

