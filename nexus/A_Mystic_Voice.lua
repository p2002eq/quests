-- A_Mystic_Voice (152019) in the Nexus - coordinator for spire teleports

function event_spawn(e)
    eq.set_timer('port', 5000);
end

function event_timer(e)
    if e.timer == 'port' then
        local players = eq.get_entity_list():GetClientList();
        eq.zone_emote(1, "player list generated");
        kunark_port(players);
    end
end

function kunark_port(player_list)
	if player_list ~= nil then
        eq.zone_emote(1, "player list not empty");
		for player in player_list.entries do
            eq.zone_emote(1, "player found: " .. player:GetName());
            eq.zone_emote(1, "player distance is " .. player:CalculateDistance(110, -462, -59));
			if player:CalculateDistance(110, -462, -59) <= 22 then
				player:CastSpell(2709);
			end
		end
	end
end
