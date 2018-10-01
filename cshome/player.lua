local instance_selection = {"ACRYLIA","AKHEVA","BOTHUNDER","CODECAY","HOHONORA","HOHONORB","KAEL","NIGHTMAREB","POAIR","PODISEASE","POEARTHA",
								"POEARTHB","POFIRE","POINNOVATION","POTACTICS","POTIMEB","POTORMENT","POVALOR","POWATER","SLEEPER","SOLROTOWER",
								"SSERU","TOV","SSRA","VEXTHAL"};	--***** if adding zones to table then list the zone table short_name (TOV & SSRA EXCEPTIONS ARE HANDLED BELOW)

function event_say(e)
	mysql = require("luasql_ext");
	qglobals = eq.get_qglobals(e.self);
	local guildid = nil
	if e.self:GetGM() then	
		if(e.message:findi("help")) then
			e.self:Message(1, string.format("Select options for help: [%s] [%s] [%s]", eq.say_link("hlp_instance",false,"Create ALL Guild Instances"), 
				eq.say_link("hlp_list",false,"List Guild Instances"),eq.say_link("hlp_expire",false,"Set Instance Expiration")));
		elseif(e.message:findi("hlp_instance")) then
			e.self:Message(15, string.format("[Create Guild Instances Help]"));
			e.self:Message(1, "This option will create instances for the predefined zones for the provided guild id.");
			e.self:Message(1, string.format("[syntax] /say instance <guild_id>    example:  /say instance 38"));		
			e.self:Message(18,string.format("NOTE: Newly created instances will expire by default.  See [%s] to set as permanent.",
				eq.say_link("hlp_expire",false,"expiration help options"))); 
		elseif(e.message:findi("hlp_list")) then
			e.self:Message(15, string.format("[List Guild Instances]"));
			e.self:Message(1, string.format("This option will list instances already created for the provided guild id.")); 
			e.self:Message(1, string.format("[syntax] /say list <guild_id>    example:  /say list 38"));
		elseif(e.message:findi("hlp_expire")) then
			e.self:Message(15, string.format("[Set Instance Expiration]"));
			e.self:Message(1, string.format("This option will allow the specified instance id to be set as permanent(1).  Use [%s] option to check if temp or perm.",
				eq.say_link("hlp_list",false,"list guild instances"))); 
			e.self:Message(1, string.format("[syntax] /say setexpire <instance_id> <0/1>    example:  /say setexpire 38 1 (sets instance 38 as permanent)"));
		elseif(e.message:findi("list")) then
			guildid = string.match(e.message, "%d+");
			local guildname = eq.get_guild_name_by_id(tonumber(guildid));
			if guildname == "Invalid Guild" then
				e.self:Message(13,"Please enter a valid Guild ID");
				return;
			end
			list_instances(e,guildname,guildid);
		-- for anniversary quest
		elseif(e.message:findi("add velk")) then	
			if (qglobals["VELKETOR"] == nil) then
				instance_id_velk = eq.create_instance("VELKETOR",0,9000000);  -- up for over 100 days 9000000
				eq.set_global("VELKETOR",tostring(instance_id_velk),7,"F");
			end
		--Create guild instances
		elseif(e.message:findi("instance")) then
			guildid = string.match(e.message, "%d+");
			--local zoneGlobal = "TOV-" .. guildid;  -- global format
			local guildname = eq.get_guild_name_by_id(tonumber(guildid));
			if guildname == "Invalid Guild" then
				e.self:Message(13,"Please enter a valid Guild ID");
				return;
			end
			
			for k,v in pairs(instance_selection) do
				zone = v;
				if v == "TOV" then zone = "TEMPLEVEESHAN" end
				if v == "SSRA" then zone = "SSRATEMPLE" end
				local zoneGlobal = v .. "-" .. tostring(guildid);
				if(qglobals[zoneGlobal] == nil) then
					local instance_id = eq.create_instance(tostring(zone),0,9000000);  -- up for over 100 days 9000000
					if instance_id ~= 0 then
						eq.set_global(zoneGlobal,tostring(instance_id),7,"F");
						e.self:Message(14,string.format("%s instance has been created, Guild Name = %s, GuildID = %s, InstanceID = %i",v,guildname,guildid,instance_id));
					else
						e.self:Message(15,string.format("%s instance has NOT been created, Guild Name = %s, GuildID = %s, Invalid zone name provided!",v,guildname,guildid));
					end
				elseif(qglobals[zoneGlobal] ~= nil) then 
					e.self:Message(13,string.format("%s instance has NOT been created, Guild Name = %s, GuildID = %s, Instance has already been created for this Guild!",v,guildname,guildid));
				end
			end
			e.self:Message(1,string.format("Instances Set for, Guild Name = %s, GuildID = %s",guildname,guildid));
		elseif(e.message:findi("setexpire")) then
			--commented section below if we want to implement toggling of perm or temp in game.  currently only set to allow instances to be set to perm and not vice versa.
			--inst_id,expire = string.match(e.message, "(%d+)%s(%d+)");
			-- if tonumber(expire) ~= 0 or tonumber(expire) ~= 1 then
				-- e.self:Message(13,string.format("Invalid expiration value provided.  Must be 0 or 1. (value used: %s)",expire));
				-- return;
			-- end
			local inst_id = string.match(e.message, "%d+");
			if inst_id ~= nil then
				for id,never_expires in mysql.rows(con,string.format("SELECT id,never_expires from instance_list WHERE id = %s",inst_id)) do
					result = id;
					no_expire = tonumber(never_expires);
				end
			end

			if result ~= nil and no_expire == 0 then
				env = mysql.env(e);
				con = mysql.con(e);
				query = mysql.con(e):execute(string.format("UPDATE instance_list SET never_expires = 1 WHERE id = %s",tostring(result)))
				con:close();
				env:close();
				e.self:Message(14,string.format("Instance [%s] has been set to never expire!",result));
			elseif result == nil then
				e.self:Message(13,"Please provide a valid instance id");
			elseif no_expire == 1 then
				e.self:Message(13,string.format("Instance [%s] was already set to be permanent!",tostring(result)));
			end			
		end
	end
end

function list_instances(e,guildname,guildid)
	e.self:Message(15,string.format("<< Instance ID Listing for Guild: %s [id: %s] >>", guildname, guildid));
	for k,v in pairs(instance_selection) do
		local global_name = tostring(v .. "-" .. guildid);
		instanceid = qglobals[global_name];
		expires = nil;
		if(instanceid ~= nil) then
			for id,never_expires in mysql.rows(false,string.format("SELECT id,never_expires from instance_list WHERE id = %s",instanceid)) do
				expires = never_expires;
			end
		end
		if(instanceid ~= nil) and (expires ~= nil) then
			e.self:Message(18,string.format("%s [id: %s] (never expires: %s)",v,tostring(instanceid),tostring(expires)));
		else
			e.self:Message(13,string.format("%s - NO INSTANCE AVAILABLE",v));
		end		
	end
end