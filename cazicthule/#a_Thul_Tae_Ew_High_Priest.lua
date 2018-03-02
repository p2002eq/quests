-- Thul Tae Ew High Priest trigger for Ring of Fear encounter in Cazic Thule
function event_spawn(e)
	e.self:ModifyNPCStat("runspeed","0");
	eq.unique_spawn(48057, 0, 0, 587, 1090, -98,0.0); -- Tahia Felwah
	inactive(eq.spawn2(48001, 0, 0, 587, 1055, -95,0.0); -- a Tae Ew Justicar
	inactive(eq.spawn2(48001, 0, 0, 587, 1128, -95,256.0); -- a Tae Ew Justicar
	inactive(eq.spawn2(48001, 0, 0, 550, 1090, -95,128.0); -- a Tae Ew Justicar
	inactive(eq.spawn2(48001, 0, 0, 625, 1090, -95,384.0); -- a Tae Ew Justicar
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
			if not ents:IsMobSpawnedByNpcTypeID(48378) and not ents:IsMobSpawnedByNpcTypeID(48379) and not ents:IsMobSpawnedByNpcTypeID(48380) then -- Guard Khataruss, Guard Scithiss and Guard Thrasciss
				eq.unique_spawn(48378,0,0,642,1101,-92,270.0); -- Guard Khataruss
				eq.unique_spawn(48379,0,0,585,1146,-92,252.0); -- Guard Scithiss
				eq.unique_spawn(48380,0,0,537,1103,-92,250.0); -- Guard Thrasciss
			end
		else
			eq.depop(48378); -- Guard Khataruss
			eq.depop(48379); -- Guard Scithiss
			eq.depop(48380); -- Guard Thrasciss
			eq.stop_timer("guards");
		end
	end
end

function event_hate_list(e)
	if e.joined then
		eq.get_entity_list():GetMobByNpcTypeID(48378):AddToHateList(e.other, 1); -- Guard Khataruss
		eq.get_entity_list():GetMobByNpcTypeID(48379):AddToHateList(e.other, 1); -- Guard Scithiss
		eq.get_entity_list():GetMobByNpcTypeID(48380):AddToHateList(e.other, 1); -- Guard Thrasciss
	end
end

function event_death_complete(e)
	e.self:Shout("Oh facelesss one, I have fallen! Pleasse avenge the death of your faithful ssservant!");
	eq.signal(48001, 99); -- a Tae Ew Justicar -- Kill
	eq.get_entity_list():GetMobByNpcTypeID(48057):Depop(); -- Tahia Felwah -- depop laying Tahia
	eq.unique_spawn(48388,0.0, 0, 587, 1090, -98, 0); -- Tahia Felwah -- spawn standing Tahia
end

function inactive(mob)
	mob:SetBodyType(11, true);
	mob:SetSpecialAbility(24, 1);
end
