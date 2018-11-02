--#Enchanted_Rat (2181)

local diseased = 2179  --NPC ID for diseased rat
local healthy = 2180 -- NPC ID for healthy rat

function event_spawn(e)
	-- checks for NPC in area
    local x = e.self:GetX();
    local y = e.self:GetY();
    local z = e.self:GetZ();
	
	e.self:Emote("scurries happily out of the jar");
	
	local npc_list = eq.get_entity_list():GetNPCList();
	local minNorth;	--heading to target 255.75
	local minSouth;	--heading to target 511.5
	local minWest;	--heading to target 383.625
	local minEast;	--heading to target 127.875
	
	if(npc_list ~= nil) then		-- first loop to establish minimum distance to healthy rats
		for npc in npc_list.entries do	
			if npc:GetNPCTypeID() == healthy then
				if (npc:CalculateHeadingToTarget(x,y) == 255.75) then --Checks north of tile 
					if minNorth == nil then
						minNorth = npc:CalculateDistance(x,y,z);
					elseif(npc:CalculateDistance(x,y,z) < minNorth) then
						minNorth = npc:CalculateDistance(x,y,z);
					end
				elseif(npc:CalculateHeadingToTarget(x,y) == 511.5) then  --Checks south of tile 
					if minSouth == nil then
						minSouth = npc:CalculateDistance(x,y,z);
					elseif(npc:CalculateDistance(x,y,z) < minSouth) then
						minSouth = npc:CalculateDistance(x,y,z);
					end
				elseif(npc:CalculateHeadingToTarget(x,y) == 383.625) then  --Checks west of tile 
					if minWest == nil then
						minWest = npc:CalculateDistance(x,y,z);
					elseif(npc:CalculateDistance(x,y,z) < minWest) then
						minWest = npc:CalculateDistance(x,y,z);
					end
				elseif(npc:CalculateHeadingToTarget(x,y) == 127.875) then  --Checks east of tile 
					if minEast == nil then
						minEast = npc:CalculateDistance(x,y,z);
					elseif(npc:CalculateDistance(x,y,z) < minEast) then
						minEast = npc:CalculateDistance(x,y,z);
					end	
				end
			end
		end
		
		for npc in npc_list.entries do			--second loop to use minimum values to determine which diseased rats can be cured in all four directions
			if npc:GetNPCTypeID() == diseased then
				if (npc:CalculateHeadingToTarget(x,y) == 255.75) then --Checks north of tile 
					if (minNorth ~= nil) and (npc:CalculateDistance(x,y,z) < minNorth) then
						npc:Depop();		--depop diseased rat
						eq.spawn2(healthy,0,0,npc:GetX(),npc:GetY(),npc:GetZ(),0);	--spawns healthy rat
					end
				elseif(npc:CalculateHeadingToTarget(x,y) == 511.5) then  --Checks south of tile 
					if (minSouth ~= nil) and (npc:CalculateDistance(x,y,z) < minSouth) then
						npc:Depop();		--depop diseased rat
						eq.spawn2(healthy,0,0,npc:GetX(),npc:GetY(),npc:GetZ(),0);	--spawns healthy rat
					end
				elseif(npc:CalculateHeadingToTarget(x,y) == 383.625) then  --Checks west of tile 
					if (minWest ~= nil) and (npc:CalculateDistance(x,y,z) < minWest) then
						npc:Depop();		--depop diseased rat
						eq.spawn2(healthy,0,0,npc:GetX(),npc:GetY(),npc:GetZ(),0);	--spawns healthy rat
					end
				elseif(npc:CalculateHeadingToTarget(x,y) == 127.875) then  --Checks east of tile 
					if (minEast ~= nil) and (npc:CalculateDistance(x,y,z) < minEast) then
						npc:Depop();		--depop diseased rat
						eq.spawn2(healthy,0,0,npc:GetX(),npc:GetY(),npc:GetZ(),0);	--spawns healthy rat
					end
				end
			end
		end	
	end
end