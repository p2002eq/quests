-- Thul Tae Ew High Priest trigger for Ring of Fear encounter in Cazic Thule

function event_spawn(e)
	e.self:ModifyNPCStat("runspeed","0");
	tahia = eq.unique_spawn(48057, 0, 0, 587, 1090, -98, 0):SetAppearance(3);
	justicars = {};
	table.insert(justicars, eq.spawn2(48001, 0, 0, 587, 1055, -95, 0):GetID());
	table.insert(justicars, eq.spawn2(48001, 0, 0, 587, 1128, -95, 128):GetID());
	table.insert(justicars, eq.spawn2(48001, 0, 0, 550, 1090, -95, 64):GetID());
	table.insert(justicars, eq.spawn2(48001, 0, 0, 625, 1090, -95, 192):GetID());

	for _, v in ipairs(justicars) do
		eq.get_entity_list():GetMob(v):SetBodyType(11, true);
	end
end

function event_hate_list(e)
	if e.joined then
		eq.get_entity_list():GetMobByNpcTypeID(48378):AddToHateList(e.other, 1);
		eq.get_entity_list():GetMobByNpcTypeID(48379):AddToHateList(e.other, 1);
		eq.get_entity_list():GetMobByNpcTypeID(48380):AddToHateList(e.other, 1);
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

function event_combat(e)
	if(e.joined == true) then
		e.self:Shout("Fools! It isss dangerouss to interrupt the sssacrifice! Guards, assssissst me!");
		eq.set_timer("guards", 1000);
	end
end

function event_death_complete(e)
	e.self:Shout("Oh facelesss one, I have fallen! Pleasse avenge the death of your faithful ssservant!");
	tahia:Depop();
	local ents = eq.get_entity_list();
	for _, v in ipairs(justicars) do
		local self = ents:GetMob(v);
		self:SpellFinished(2127, self);
		self:Depop();
	end
	eq.unique_spawn(48388, 0, 0, 587, 1090, -98, 0);
end
