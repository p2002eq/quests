-- vulak event, on death aoe heal/mana
function event_death_complete(e)
	local player_list = eq.get_entity_list():GetClientList();
	local aoeSpells = true;
	if(player_list ~= nil) then
		for player in player_list.entries do	
			if(aoeSpells and player:Class() ~= "Bard" and player:CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ()) <= 100) then
				player:SpellFinished(2698,player,0,0);
				player:SpellFinished(2697,player,0,0);
				aoeSpells = false;
			end
		end
	end
end