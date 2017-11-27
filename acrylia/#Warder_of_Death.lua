--#Warder of Death (154155)
--Khati Sha Event

local sacrifice_locs = { [1] = {433,-338,36,260}, [2] = {393,-298,36,63}, [3] = {433,-258,36,128} };

function event_spawn(e)
	eq.set_timer("sacrifice", math.random(15,30) * 1000);
	eq.unique_spawn(154096,0,0,433,-298,37,260) --spawns #a_sacrifical_cauldron
end

function event_timer(e)
	if(e.timer == "sacrifice") then
		eq.stop_timer(e.timer);
		eq.set_timer("sacrifice", math.random(30,45) * 1000);
		eq.spawn2(154150,0,0,unpack(sacrifice_locs[math.random(1,3)]));	--a_sacrifice
	end
end

function event_combat(e)
	if e.joined then
		e.self:Say("As guardian of the second seal, hear this: Mine is the seal of death, and only a fool would attempt to defeat it. You rush headlong to your demise.")
	end
end

function event_signal(e)
	if e.signal == 10 then		--event failure - timer up
		eq.depop(154096);	--despawn #a_sacrifical_cauldron
		eq.depop();	
	end
end

function event_death_complete(e)
	eq.stop_timer("sacrifice");
	eq.signal(154130,11);	--signal death seal is broken
	eq.zone_emote(13,"The Death Ward has been defeated. The second seal is broken.")
	eq.depop(154096);		--despawn #a_sacrifical_cauldron
end
