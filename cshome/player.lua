function event_say(e)
	local qglobals = eq.get_qglobals(e.self);
	local guildid = nil
	if(e.message:findi("help") and e.self:GetGM()) then
		e.self:Message(1, 'Available Options are "\instance (GuildID)"');
	elseif(e.message:findi("instance") and e.self:GetGM()) then
		guildid = string.match(e.message, "%d+");
		local zoneGlobal = "TOV-" .. guildid;
		local guildname = eq.get_guild_name_by_id(tonumber(guildid));

		if(qglobals["KAEL-" .. tostring(guildid)] == nil) then
			instance_id_kael = eq.create_instance("KAEL",0,9000000);  -- up for over 100 days 9000000
			eq.set_global("KAEL-" .. guildid,tostring(instance_id_kael),7,"F");
			e.self:Message(string.format("Kael instance has been created, Guild Name = %s, GuildID = %i, InstanceID = %i!",guildname,guildid,instance_id_kael));
		elseif(qglobals["KAEL-" .. tostring(guildid)] ~= nil) then
			e.self:Message(string.format("Kael instance has NOT been created, Guild Name = %s, GuildID = %s, Instance has already been created for this Guild!",guildname,guildid));
		end

		if(qglobals["TOV-" .. tostring(guildid)] == nil) then
			instance_id_tov = eq.create_instance("TEMPLEVEESHAN",0,9000000);  -- up for over 100 days 9000000
			eq.set_global("TOV-" .. guildid,tostring(instance_id_tov),7,"F");
			e.self:Message(string.format("TOV instance has been created, Guild Name = %s, GuildID = %s, InstanceID = %i!",guildname,guildid,instance_id_kael));
		elseif(qglobals["TOV-" .. tostring(guildid)] ~= nil) then
			e.self:Message(string.format("TOV instance has NOT been created, Guild Name = %s, GuildID = %s, Instance has already been created for this Guild!",guildname,guildid));
		end

		if(qglobals["SLEEPER-" .. tostring(guildid)] == nil) then
			instance_id_sleeper = eq.create_instance("SLEEPER",0,9000000);  -- up for over 100 days 9000000
			eq.set_global("SLEEPER-" .. guildid,tostring(instance_id_sleeper),7,"F");
			e.self:Message(string.format("SLEEPER instance has been created, Guild Name = %s, GuildID = %s, InstanceID = %i!",guildname,guildid,instance_id_kael));
		elseif(qglobals["SLEEPER-" .. tostring(guildid)] ~= nil) then
			e.self:Message(string.format("SLEEPER instance has NOT been created, Guild Name = %s, GuildID = %s, Instance has already been created for this Guild!",guildname,guildid));
		end

		if(qglobals["SSRA-" .. tostring(guildid)] == nil) then
			instance_id_ssra = eq.create_instance("SSRATEMPLE",0,9000000);  -- up for over 100 days 9000000
			eq.set_global("SSRA-" .. guildid,tostring(instance_id_ssra),7,"F");
			e.self:Message(string.format("SSRA instance has been created, Guild Name = %s, GuildID = %s, InstanceID = %i!",guildname,guildid,instance_id_kael));
		elseif(qglobals["SSRA-" .. tostring(guildid)] ~= nil) then
			e.self:Message(string.format("SSRA instance has NOT been created, Guild Name = %s, GuildID = %s, Instance has already been created for this Guild!",guildname,guildid));
		end

		if(qglobals["SSERU-" .. tostring(guildid)] == nil) then
			instance_id_sseru = eq.create_instance("SSERU",0,9000000);  -- up for over 100 days 9000000
			eq.set_global("SSERU-" .. guildid,tostring(instance_id_sseru),7,"F");
			e.self:Message(string.format("SSERU instance has been created, Guild Name = %s, GuildID = %s, InstanceID = %i!",guildname,guildid,instance_id_kael));
		elseif(qglobals["SSERU-" .. tostring(guildid)] ~= nil) then
			e.self:Message(string.format("SSERU instance has NOT been created, Guild Name = %s, GuildID = %s, Instance has already been created for this Guild!",guildname,guildid));
		end

		if(qglobals["VEXTHAL-" .. tostring(guildid)] == nil) then
			instance_id_vexthal = eq.create_instance("VEXTHAL",0,9000000);  -- up for over 100 days 9000000
			eq.set_global("VEXTHAL-" .. guildid,tostring(instance_id_vexthal),7,"F");
			e.self:Message(string.format("VEXTHAL instance has been created, Guild Name = %s, GuildID = %s, InstanceID = %i!",guildname,guildid,instance_id_kael));
		elseif(qglobals["VEXTHAL-" .. tostring(guildid)] ~= nil) then
			e.self:Message(string.format("VEXTHAL instance has NOT been created, Guild Name = %s, GuildID = %s, Instance has already been created for this Guild!",guildname,guildid));
		end

		if(qglobals["AKHEVA-" .. tostring(guildid)] == nil) then
			instance_id_akheva = eq.create_instance("AKHEVA",0,9000000);  -- up for over 100 days 9000000
			eq.set_global("AKHEVA-" .. guildid,tostring(instance_id_akheva),7,"F");
			e.self:Message(string.format("AKHEVA instance has been created, Guild Name = %s, GuildID = %s, InstanceID = %i!",guildname,guildid,instance_id_kael));
		elseif(qglobals["AKHEVA-" .. tostring(guildid)] ~= nil) then
			e.self:Message(string.format("AKHEVA instance has NOT been created, Guild Name = %s, GuildID = %s, Instance has already been created for this Guild!",guildname,guildid));
		end
		e.self:Message(string.format("Instances Set for, Guild Name = %s, GuildID = %s",guildname,guildid));
	end
end