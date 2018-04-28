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
			e.self:Message(14,string.format("Kael instance has been created, Guild Name = %s, GuildID = %s, InstanceID = %i",guildname,guildid,instance_id_kael));
		elseif(qglobals["KAEL-" .. tostring(guildid)] ~= nil) then
			e.self:Message(13,string.format("Kael instance has NOT been created, Guild Name = %s, GuildID = %s, Instance has already been created for this Guild!",guildname,guildid));
		end

		if(qglobals["TOV-" .. tostring(guildid)] == nil) then
			instance_id_tov = eq.create_instance("TEMPLEVEESHAN",0,9000000);  -- up for over 100 days 9000000
			eq.set_global("TOV-" .. guildid,tostring(instance_id_tov),7,"F");
			e.self:Message(14,string.format("TOV instance has been created, Guild Name = %s, GuildID = %s, InstanceID = %i",guildname,guildid,instance_id_tov));
		elseif(qglobals["TOV-" .. tostring(guildid)] ~= nil) then
			e.self:Message(13,string.format("TOV instance has NOT been created, Guild Name = %s, GuildID = %s, Instance has already been created for this Guild!",guildname,guildid));
		end

		if(qglobals["SLEEPER-" .. tostring(guildid)] == nil) then
			instance_id_sleeper = eq.create_instance("SLEEPER",0,9000000);  -- up for over 100 days 9000000
			eq.set_global("SLEEPER-" .. guildid,tostring(instance_id_sleeper),7,"F");
			e.self:Message(14,string.format("SLEEPER instance has been created, Guild Name = %s, GuildID = %s, InstanceID = %i",guildname,guildid,instance_id_sleeper));
		elseif(qglobals["SLEEPER-" .. tostring(guildid)] ~= nil) then
			e.self:Message(13,string.format("SLEEPER instance has NOT been created, Guild Name = %s, GuildID = %s, Instance has already been created for this Guild!",guildname,guildid));
		end

		if(qglobals["SSRA-" .. tostring(guildid)] == nil) then
			instance_id_ssra = eq.create_instance("SSRATEMPLE",0,9000000);  -- up for over 100 days 9000000
			eq.set_global("SSRA-" .. guildid,tostring(instance_id_ssra),7,"F");
			e.self:Message(14,string.format("SSRA instance has been created, Guild Name = %s, GuildID = %s, InstanceID = %i",guildname,guildid,instance_id_ssra));
		elseif(qglobals["SSRA-" .. tostring(guildid)] ~= nil) then
			e.self:Message(13,string.format("SSRA instance has NOT been created, Guild Name = %s, GuildID = %s, Instance has already been created for this Guild!",guildname,guildid));
		end

		if(qglobals["SSERU-" .. tostring(guildid)] == nil) then
			instance_id_sseru = eq.create_instance("SSERU",0,9000000);  -- up for over 100 days 9000000
			eq.set_global("SSERU-" .. guildid,tostring(instance_id_sseru),7,"F");
			e.self:Message(14,string.format("SSERU instance has been created, Guild Name = %s, GuildID = %s, InstanceID = %i",guildname,guildid,instance_id_sseru));
		elseif(qglobals["SSERU-" .. tostring(guildid)] ~= nil) then
			e.self:Message(13,string.format("SSERU instance has NOT been created, Guild Name = %s, GuildID = %s, Instance has already been created for this Guild!",guildname,guildid));
		end

		if(qglobals["VEXTHAL-" .. tostring(guildid)] == nil) then
			instance_id_vexthal = eq.create_instance("VEXTHAL",0,9000000);  -- up for over 100 days 9000000
			eq.set_global("VEXTHAL-" .. guildid,tostring(instance_id_vexthal),7,"F");
			e.self:Message(14,string.format("VEXTHAL instance has been created, Guild Name = %s, GuildID = %s, InstanceID = %i",guildname,guildid,instance_id_vexthal));
		elseif(qglobals["VEXTHAL-" .. tostring(guildid)] ~= nil) then
			e.self:Message(13,string.format("VEXTHAL instance has NOT been created, Guild Name = %s, GuildID = %s, Instance has already been created for this Guild!",guildname,guildid));
		end

		if(qglobals["AKHEVA-" .. tostring(guildid)] == nil) then
			instance_id_akheva = eq.create_instance("AKHEVA",0,9000000);  -- up for over 100 days 9000000
			eq.set_global("AKHEVA-" .. guildid,tostring(instance_id_akheva),7,"F");
			e.self:Message(14,string.format("AKHEVA instance has been created, Guild Name = %s, GuildID = %s, InstanceID = %i",guildname,guildid,instance_id_akheva));
		elseif(qglobals["AKHEVA-" .. tostring(guildid)] ~= nil) then
			e.self:Message(13,string.format("AKHEVA instance has NOT been created, Guild Name = %s, GuildID = %s, Instance has already been created for this Guild!",guildname,guildid));
		end
		
		if(qglobals["ACRYLIA-" .. tostring(guildid)] == nil) then
			instance_id_acrylia = eq.create_instance("ACRYLIA",0,9000000);  -- up for over 100 days 9000000
			eq.set_global("ACRYLIA-" .. guildid,tostring(instance_id_acrylia),7,"F");
			e.self:Message(14,string.format("ACRYLIA instance has been created, Guild Name = %s, GuildID = %s, InstanceID = %i",guildname,guildid,instance_id_acrylia));
		elseif(qglobals["ACRYLIA-" .. tostring(guildid)] ~= nil) then
			e.self:Message(13,string.format("ACRYLIA instance has NOT been created, Guild Name = %s, GuildID = %s, Instance has already been created for this Guild!",guildname,guildid));
		end

		if(qglobals["PODISEASE-" .. tostring(guildid)] == nil) then
			instance_id_PODISEASE = eq.create_instance("PODISEASE",0,9000000);  -- up for over 100 days 9000000
			eq.set_global("PODISEASE-" .. guildid,tostring(instance_id_PODISEASE),7,"F");
			e.self:Message(14,string.format("PODISEASE instance has been created, Guild Name = %s, GuildID = %s, InstanceID = %i",guildname,guildid,instance_id_PODISEASE));
		elseif(qglobals["PODISEASE-" .. tostring(guildid)] ~= nil) then
			e.self:Message(13,string.format("PODISEASE instance has NOT been created, Guild Name = %s, GuildID = %s, Instance has already been created for this Guild!",guildname,guildid));
		end

		if(qglobals["POINNOVATION-" .. tostring(guildid)] == nil) then
			instance_id_POINNOVATION = eq.create_instance("POINNOVATION",0,9000000);  -- up for over 100 days 9000000
			eq.set_global("POINNOVATION-" .. guildid,tostring(instance_id_POINNOVATION),7,"F");
			e.self:Message(14,string.format("POINNOVATION instance has been created, Guild Name = %s, GuildID = %s, InstanceID = %i",guildname,guildid,instance_id_POINNOVATION));
		elseif(qglobals["POINNOVATION-" .. tostring(guildid)] ~= nil) then
			e.self:Message(13,string.format("POINNOVATION instance has NOT been created, Guild Name = %s, GuildID = %s, Instance has already been created for this Guild!",guildname,guildid));
		end
		if(qglobals["POVALOR-" .. tostring(guildid)] == nil) then
			instance_id_POVALOR = eq.create_instance("POVALOR",0,9000000);  -- up for over 100 days 9000000
			eq.set_global("POVALOR-" .. guildid,tostring(instance_id_POVALOR),7,"F");
			e.self:Message(14,string.format("POVALOR instance has been created, Guild Name = %s, GuildID = %s, InstanceID = %i",guildname,guildid,instance_id_POVALOR));
		elseif(qglobals["POVALOR-" .. tostring(guildid)] ~= nil) then
			e.self:Message(13,string.format("POVALOR instance has NOT been created, Guild Name = %s, GuildID = %s, Instance has already been created for this Guild!",guildname,guildid));
		end
		if(qglobals["CODECAY-" .. tostring(guildid)] == nil) then
			instance_id_CODECAY = eq.create_instance("CODECAY",0,9000000);  -- up for over 100 days 9000000
			eq.set_global("CODECAY-" .. guildid,tostring(instance_id_CODECAY),7,"F");
			e.self:Message(14,string.format("CODECAY instance has been created, Guild Name = %s, GuildID = %s, InstanceID = %i",guildname,guildid,instance_id_CODECAY));
		elseif(qglobals["CODECAY-" .. tostring(guildid)] ~= nil) then
			e.self:Message(13,string.format("CODECAY instance has NOT been created, Guild Name = %s, GuildID = %s, Instance has already been created for this Guild!",guildname,guildid));
		end
		if(qglobals["POTORMENT-" .. tostring(guildid)] == nil) then
			instance_id_POTORMENT = eq.create_instance("POTORMENT",0,9000000);  -- up for over 100 days 9000000
			eq.set_global("POTORMENT-" .. guildid,tostring(instance_id_POTORMENT),7,"F");
			e.self:Message(14,string.format("POTORMENT instance has been created, Guild Name = %s, GuildID = %s, InstanceID = %i",guildname,guildid,instance_id_POTORMENT));
		elseif(qglobals["POTORMENT-" .. tostring(guildid)] ~= nil) then
			e.self:Message(13,string.format("POTORMENT instance has NOT been created, Guild Name = %s, GuildID = %s, Instance has already been created for this Guild!",guildname,guildid));
		end
		if(qglobals["BOTHUNDER-" .. tostring(guildid)] == nil) then
			instance_id_BOTHUNDER = eq.create_instance("BOTHUNDER",0,9000000);  -- up for over 100 days 9000000
			eq.set_global("BOTHUNDER-" .. guildid,tostring(instance_id_BOTHUNDER),7,"F");
			e.self:Message(14,string.format("BOTHUNDER instance has been created, Guild Name = %s, GuildID = %s, InstanceID = %i",guildname,guildid,instance_id_BOTHUNDER));
		elseif(qglobals["BOTHUNDER-" .. tostring(guildid)] ~= nil) then
			e.self:Message(13,string.format("BOTHUNDER instance has NOT been created, Guild Name = %s, GuildID = %s, Instance has already been created for this Guild!",guildname,guildid));
		end
		if(qglobals["HOHONORA-" .. tostring(guildid)] == nil) then
			instance_id_HOHONORA = eq.create_instance("HOHONORA",0,9000000);  -- up for over 100 days 9000000
			eq.set_global("HOHONORA-" .. guildid,tostring(instance_id_HOHONORA),7,"F");
			e.self:Message(14,string.format("HOHONORA instance has been created, Guild Name = %s, GuildID = %s, InstanceID = %i",guildname,guildid,instance_id_HOHONORA));
		elseif(qglobals["HOHONORA-" .. tostring(guildid)] ~= nil) then
			e.self:Message(13,string.format("HOHONORA instance has NOT been created, Guild Name = %s, GuildID = %s, Instance has already been created for this Guild!",guildname,guildid));
		end
		if(qglobals["HOHONORB-" .. tostring(guildid)] == nil) then
			instance_id_HOHONORB = eq.create_instance("HOHONORB",0,9000000);  -- up for over 100 days 9000000
			eq.set_global("HOHONORB-" .. guildid,tostring(instance_id_HOHONORB),7,"F");
			e.self:Message(14,string.format("HOHONORB instance has been created, Guild Name = %s, GuildID = %s, InstanceID = %i",guildname,guildid,instance_id_HOHONORB));
		elseif(qglobals["HOHONORB-" .. tostring(guildid)] ~= nil) then
			e.self:Message(13,string.format("HOHONORB instance has NOT been created, Guild Name = %s, GuildID = %s, Instance has already been created for this Guild!",guildname,guildid));
		end
		if(qglobals["NIGHTMAREB-" .. tostring(guildid)] == nil) then
			instance_id_NIGHTMAREB = eq.create_instance("NIGHTMAREB",0,9000000);  -- up for over 100 days 9000000
			eq.set_global("NIGHTMAREB-" .. guildid,tostring(instance_id_NIGHTMAREB),7,"F");
			e.self:Message(14,string.format("NIGHTMAREB instance has been created, Guild Name = %s, GuildID = %s, InstanceID = %i",guildname,guildid,instance_id_NIGHTMAREB));
		elseif(qglobals["NIGHTMAREB-" .. tostring(guildid)] ~= nil) then
			e.self:Message(13,string.format("NIGHTMAREB instance has NOT been created, Guild Name = %s, GuildID = %s, Instance has already been created for this Guild!",guildname,guildid));
		end
		if(qglobals["POTACTICS-" .. tostring(guildid)] == nil) then
			instance_id_POTACTICS = eq.create_instance("POTACTICS",0,9000000);  -- up for over 100 days 9000000
			eq.set_global("POTACTICS-" .. guildid,tostring(instance_id_POTACTICS),7,"F");
			e.self:Message(14,string.format("POTACTICS instance has been created, Guild Name = %s, GuildID = %s, InstanceID = %i",guildname,guildid,instance_id_POTACTICS));
		elseif(qglobals["POTACTICS-" .. tostring(guildid)] ~= nil) then
			e.self:Message(13,string.format("POTACTICS instance has NOT been created, Guild Name = %s, GuildID = %s, Instance has already been created for this Guild!",guildname,guildid));
		end
		if(qglobals["POFIRE-" .. tostring(guildid)] == nil) then
			instance_id_POFIRE = eq.create_instance("POFIRE",0,9000000);  -- up for over 100 days 9000000
			eq.set_global("POFIRE-" .. guildid,tostring(instance_id_POFIRE),7,"F");
			e.self:Message(14,string.format("POFIRE instance has been created, Guild Name = %s, GuildID = %s, InstanceID = %i",guildname,guildid,instance_id_POFIRE));
		elseif(qglobals["POFIRE-" .. tostring(guildid)] ~= nil) then
			e.self:Message(13,string.format("POFIRE instance has NOT been created, Guild Name = %s, GuildID = %s, Instance has already been created for this Guild!",guildname,guildid));
		end
		if(qglobals["POWATER-" .. tostring(guildid)] == nil) then
			instance_id_POWATER = eq.create_instance("POWATER",0,9000000);  -- up for over 100 days 9000000
			eq.set_global("POWATER-" .. guildid,tostring(instance_id_POWATER),7,"F");
			e.self:Message(14,string.format("POWATER instance has been created, Guild Name = %s, GuildID = %s, InstanceID = %i",guildname,guildid,instance_id_POWATER));
		elseif(qglobals["POWATER-" .. tostring(guildid)] ~= nil) then
			e.self:Message(13,string.format("POWATER instance has NOT been created, Guild Name = %s, GuildID = %s, Instance has already been created for this Guild!",guildname,guildid));
		end
		if(qglobals["POEARTHA-" .. tostring(guildid)] == nil) then
			instance_id_POEARTHA = eq.create_instance("POEARTHA",0,9000000);  -- up for over 100 days 9000000
			eq.set_global("POEARTHA-" .. guildid,tostring(instance_id_POEARTHA),7,"F");
			e.self:Message(14,string.format("POEARTHA instance has been created, Guild Name = %s, GuildID = %s, InstanceID = %i",guildname,guildid,instance_id_POEARTHA));
		elseif(qglobals["POEARTHA-" .. tostring(guildid)] ~= nil) then
			e.self:Message(13,string.format("POEARTHA instance has NOT been created, Guild Name = %s, GuildID = %s, Instance has already been created for this Guild!",guildname,guildid));
		end
		if(qglobals["POEARTHB-" .. tostring(guildid)] == nil) then
			instance_id_POEARTHB = eq.create_instance("POEARTHB",0,9000000);  -- up for over 100 days 9000000
			eq.set_global("POEARTHB-" .. guildid,tostring(instance_id_POEARTHB),7,"F");
			e.self:Message(14,string.format("POEARTHB instance has been created, Guild Name = %s, GuildID = %s, InstanceID = %i",guildname,guildid,instance_id_POEARTHB));
		elseif(qglobals["POEARTHB-" .. tostring(guildid)] ~= nil) then
			e.self:Message(13,string.format("POEARTHB instance has NOT been created, Guild Name = %s, GuildID = %s, Instance has already been created for this Guild!",guildname,guildid));
		end
		if(qglobals["POAIR-" .. tostring(guildid)] == nil) then
			instance_id_POAIR = eq.create_instance("POAIR",0,9000000);  -- up for over 100 days 9000000
			eq.set_global("POAIR-" .. guildid,tostring(instance_id_POAIR),7,"F");
			e.self:Message(14,string.format("POAIR instance has been created, Guild Name = %s, GuildID = %s, InstanceID = %i",guildname,guildid,instance_id_POAIR));
		elseif(qglobals["POAIR-" .. tostring(guildid)] ~= nil) then
			e.self:Message(13,string.format("POAIR instance has NOT been created, Guild Name = %s, GuildID = %s, Instance has already been created for this Guild!",guildname,guildid));
		end
		if(qglobals["SOLROTOWER-" .. tostring(guildid)] == nil) then
			instance_id_SOLROTOWER = eq.create_instance("SOLROTOWER",0,9000000);  -- up for over 100 days 9000000
			eq.set_global("SOLROTOWER-" .. guildid,tostring(instance_id_SOLROTOWER),7,"F");
			e.self:Message(14,string.format("SOLROTOWER instance has been created, Guild Name = %s, GuildID = %s, InstanceID = %i",guildname,guildid,instance_id_SOLROTOWER));
		elseif(qglobals["SOLROTOWER-" .. tostring(guildid)] ~= nil) then
			e.self:Message(13,string.format("SOLROTOWER instance has NOT been created, Guild Name = %s, GuildID = %s, Instance has already been created for this Guild!",guildname,guildid));
		end
		if(qglobals["POTIMEB-" .. tostring(guildid)] == nil) then
			instance_id_POTIMEB = eq.create_instance("POTIMEB",0,9000000);  -- up for over 100 days 9000000
			eq.set_global("POTIMEB-" .. guildid,tostring(instance_id_POTIMEB),7,"F");
			e.self:Message(14,string.format("POTIMEB instance has been created, Guild Name = %s, GuildID = %s, InstanceID = %i",guildname,guildid,instance_id_POTIMEB));
		elseif(qglobals["POTIMEB-" .. tostring(guildid)] ~= nil) then
			e.self:Message(13,string.format("POTIMEB instance has NOT been created, Guild Name = %s, GuildID = %s, Instance has already been created for this Guild!",guildname,guildid));
		end

		e.self:Message(1,string.format("Instances Set for, Guild Name = %s, GuildID = %s",guildname,guildid));
	end
end