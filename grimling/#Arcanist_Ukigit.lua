-- #Arcanist_Ukigit (167716) in Grimling for BST epic (untargettable version)

-- IDs and locations of the additional caster mobs in the camp
casters = { 167669, 167717, 167675 }
spawn_locs = { [1] = {-1309, 527, 48, 80}; [2] = {-1276, 576, 47, 119}; [3] = {-1217, 565, 48, 145}; [4] = {-1175, 542, 50, 135} };

function event_spawn(e)
    -- spawn casters
    for _, locs in pairs(spawn_locs) do
        local mob = eq.ChooseRandom(unpack(casters));
        eq.spawn2(mob, 0, 0, locs[1], locs[2], locs[3],0.0)
    end
    -- set monitoring timer
    eq.set_timer('mob_check', 30 * 1000);
end


function event_timer(e)
    if e.timer == 'mob_check' then
        if not mob_check(e.self) then -- once camp is empty, spawn real version
            eq.unique_spawn(167703, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading())
            eq.depop()
        end
    end
end

function mob_check(e_self)
	-- checks for NPC in area
    local x = e_self:GetX();
    local y = e_self:GetY();
    local z = e_self:GetZ();
	local npc_list = eq.get_entity_list():GetNPCList();
	if(npc_list ~= nil) then
		for npc in npc_list.entries do
			if npc:CalculateDistance(x, y, z) <= 200 and npc:GetNPCTypeID() ~= 167716 and not npc:IsPet() then
				return true; -- npc within 200 other than self and pets!
			end
		end
	end
	
	return false; -- if nothing found, returns false
end
