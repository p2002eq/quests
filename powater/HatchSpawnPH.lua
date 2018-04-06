--HatchSpawnPH (216058)
--selects mob trap spawns based on depth in zone
--powater

function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	local zloc = e.self:GetZ();
	eq.set_proximity(xloc - 40, xloc + 40, yloc - 40, yloc + 40, zloc - 20, zloc + 20);
end

function event_enter(e)
	local rand = math.random(1,100);
	if not e.other:GetGM() and rand <= 10 and not e.other:CastToMob():IsInvisible() then 	--low percentage to trigger given amount of traps in zone
		local x, y, z, h = e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading();
		local spawns = math.random(2,3) -- 2-3 spawns per trap
		local npc_id = mob_selection(z);
		
		for n = 1,spawns do 
			local spawned = eq.spawn2(npc_id, 0, 0, x + math.random(-5,5), y + math.random(-5,5), z + 5, h);	
			eq.set_timer('depop', 5 * 60 * 1000, spawned);
		end
        
        eq.local_emote({x,y,z},7,75,"A swarm of tiny creatures erupts around you in a feeding frenzy."); 
        eq.depop_with_timer();
	end
end

function mob_selection(zloc)
	if zloc >= -100 then
		npc_id = 216274 --#a_young_sea_turtle (216274)
	elseif zloc >= -500 then
		npc_id = 216272 --#a_young_swordfish (216272)
	else
		npc_id = 216273 --#a_young_regrua (216273)
	end
	
	return npc_id;
end
	
