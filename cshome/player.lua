function event_say(e)
	local guildid = nil
	if(e.message:findi("help") and e.self:GetGM()) then
		event_emote(e,"Available Options are '\Set Instance (GuildID)'");
	elseif(e.message:findi("set instance") and e.self:GetGM()) then
		event_emote(e,"Use 'Set Instance (GuildID) to assign an instance");
		guildid = e.message:match("set instance%s*(%a+)")


		instance_id_kael = eq.create_instance("KAEL",0,9000000);  -- up for over 100 days 9000000
		eq.set_global("KAEL-" .. guildid,tonumber(instance_id_kael),7,"F");
		instance_id_tov = eq.create_instance("TEMPLEVEESHAN",0,9000000);  -- up for over 100 days 9000000
		eq.set_global("TOV-" .. guildid,tonumber(instance_id_tov),7,"F");
		instance_id_sleeper = eq.create_instance("SLEEPER",0,9000000);  -- up for over 100 days 9000000
		eq.set_global("SLEEPER-" .. guildid,tonumber(instance_id_sleeper),7,"F");
		instance_id_ssra = eq.create_instance("SSRATEMPLE",0,9000000);  -- up for over 100 days 9000000
		eq.set_global("SSRA-" .. guildid,tonumber(instance_id_ssra),7,"F");
		instance_id_sseru = eq.create_instance("SSERU",0,9000000);  -- up for over 100 days 9000000
		eq.set_global("SSERU-" .. guildid,tonumber(instance_id_sseru),7,"F");
		instance_id_vexthal = eq.create_instance("VEXTHAL",0,9000000);  -- up for over 100 days 9000000
		eq.set_global("VEXTHAL-" .. guildid,tonumber(instance_id_vexthal),7,"F");
		instance_id_akheva = eq.create_instance("AKHEVA",0,9000000);  -- up for over 100 days 9000000
		eq.set_global("AKHEVA-" .. guildid,tonumber(instance_id_akheva),7,"F");


		--eq.set_global("TOV-Veni Vidi Vici","40",7,"F");

		event_emote(e,"Instances Set");
	end
end

function event_emote(e,message)
	local player_list = eq.get_entity_list():GetClientList();
	if(player_list ~= nil) then
		for player in player_list.entries do
			if(player:CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ()) <= 200) then
				player:Message(6,message)
			end
		end
	end
end