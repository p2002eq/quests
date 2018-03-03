-- #Quillmane spawn
function event_death_complete(e)
	local random_result = math.random(100);
	local quillmane = 14139;

	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(quillmane) == false) then
		if(random_result < 3) then
			eq.spawn2(quillmane,1,0,3210,-6821.6,38.3,386.6);
		elseif(random_result >= 3 and random_result < 5) then
			eq.spawn2(quillmane,2,0,-2761.8,-6076,0.7,8);
		elseif(random_result >= 5 and random_result < 7) then
			eq.spawn2(quillmane,3,0,-2333.8,1296.5,38.7,494.6);
		end
	end
end
