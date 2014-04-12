-- #Quillmane spawn
-- #npc - #a_lioness - randomly spawns 1 of 3 Quilmane locs around the zone)
-- #zone - SouthKarana
-- #Angelox
-- # Updated by Kilelen
-- # 2nd Updated and converted to Lua by robregen

function event_death_complete(e)
	local random_result = math.random(100);
	local quillmane = 14139;

	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(quillmane) == false) then
		if(random_result < 4) then
			eq.spawn2(quillmane,1,0,3210,-6821.6,38.3,193.3);
		elseif(random_result >= 4 and random_result < 8) then
			eq.spawn2(quillmane,2,0,-2761.8,-6076,0.7,4.0);
		elseif(random_result >= 8 and random_result < 12) then
			eq.spawn2(quillmane,3,0,-2333.8,1296.5,38.7,247.3);
		end
	end
end
