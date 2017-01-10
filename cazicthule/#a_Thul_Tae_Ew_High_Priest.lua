-- Thul Tae Ew High Priest trigger for Ring of Fear encounter in Cazic Thule

function event_spawn(e)
	e.self:ModifyNPCStat("runspeed","0");
	eq.unique_spawn(48057, 0, 0, 587, 1090, -98, 0):SetAppearance(3); -- Tahia
	eq.spawn2(48001, 0, 0, 587, 1055, -95, 0):SetBodyType(11, true); -- Justicars
	eq.spawn2(48001, 0, 0, 587, 1128, -95, 128):SetBodyType(11, true);
	eq.spawn2(48001, 0, 0, 550, 1090, -95, 64):SetBodyType(11, true);
	eq.spawn2(48001, 0, 0, 625, 1090, -95, 192):SetBodyType(11, true);
end

function event_combat(e)
	if(e.joined == true) then
		e.self:Shout("Fools! It isss dangerouss to interrupt the sssacrifice! Guards, assssissst me!");
		eq.set_timer("guards", 1000);
	end
end

function event_timer(e)
	if e.timer == "guards" then
		if e.self:IsEngaged() then
			local ents = eq.get_entity_list()
			if not ents:IsMobSpawnedByNpcTypeID(48378) and not ents:IsMobSpawnedByNpcTypeID(48379) and not ents:IsMobSpawnedByNpcTypeID(48380) then
				eq.unique_spawn(48378,0,0,642,1101,-92,135):Emote("attacks with eerie speed!");
				eq.unique_spawn(48379,0,0,585,1146,-92,126):Emote("attacks with eerie speed!");
				eq.unique_spawn(48380,0,0,537,1103,-92,125):Emote("attacks with eerie speed!");
			end
		else
			eq.depop(48378);
			eq.depop(48379);
			eq.depop(48380);
			eq.stop_timer("guards");
		end
	end
end

function event_hate_list(e)
	if e.joined then
		eq.get_entity_list():GetMobByNpcTypeID(48378):AddToHateList(e.other, 1);
		eq.get_entity_list():GetMobByNpcTypeID(48379):AddToHateList(e.other, 1);
		eq.get_entity_list():GetMobByNpcTypeID(48380):AddToHateList(e.other, 1);
	end
end

function event_death_complete(e)
	e.self:Shout("Oh facelesss one, I have fallen! Pleasse avenge the death of your faithful ssservant!");
	eq.signal(48001, 99); -- blow up Justicars
	eq.get_entity_list():GetMobByNpcTypeID(48057):Depop(); -- depop laying Tahia
	eq.unique_spawn(48388, 0, 0, 587, 1090, -98, 0); -- spawn standing Tahia
end
