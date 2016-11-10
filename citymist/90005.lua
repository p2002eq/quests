-- main black reaver code
function event_death_complete(e)
	local chance_spawn = math.random(100);

	-- counts "normal" black reavers remaining *note that it includes the one that is dying!*
    local entity_list = eq.get_entity_list();
    local npc_list = entity_list:GetNPCList();
	local total = 0
    if (npc_list ~= nil) then
        for npc in npc_list.entries do
			if (npc:GetNPCTypeID() == 90005) then total = total + 1; end
        end
    end
	
	-- if no other reavers up and neither version of Rak`Ashiir is up, spawns him. Otherwise checks roll for reaver respawn or chain end mobs (shadow/Ghiosk)
	if (total <= 1 and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(90194) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(90196)) then
		eq.unique_spawn(90194,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	elseif (chance_spawn <= 25) then
		eq.spawn2(90175,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ()+10,e.self:GetHeading()); -- shadow
	elseif (chance_spawn <= 50 and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(90193)) then
		eq.unique_spawn(90193,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Ghiosk if he's not up
	else
		eq.spawn2(90005,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- reaver otherwise
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end