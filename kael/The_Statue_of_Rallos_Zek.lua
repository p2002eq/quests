--The_Statue_of_Rallos_Zek(NPC # 113628)
-- On death, spawns the Idol of Rallos Zek and sets qglobal to indicate position in cycle

function event_death_complete(e)
	-- Get Instance ID
	local instance_id = eq.get_zone_instance_id();
	-- Set QGlobal Lockout to Instance ID
	eq.set_global(instance_id.."_idol",1,3,"D6");
	-- Emote and Spawn Idol
    e.self:Shout("Protect the Idol of Zek!");
	eq.spawn2(113629,0,0,1292,1267,-35,254.5); -- Idol of Rallos Zek
end

function event_spawn(e)
	-- Get Instance ID
	local instance_id = eq.get_zone_instance_id();
	-- Delete Instanced QGlobal
	eq.delete_global(instance_id.."_idol");
	-- Depop Idol if up
	eq.depop_all(113629);  --Despawns Idol of Zek
end