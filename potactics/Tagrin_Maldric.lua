--Tagrin_Maldric (214054)
--potactics

local guards = {-1,-1,-1,-1,-1,-1}

function event_combat(e)
	if e.joined then
		eq.set_timer("adds", 15 * 1000);
	else
		eq.stop_timer("adds");
	end
end

function event_timer(e)
	if e.timer == "adds" then
		spawn_guards(e);
	end
end


function spawn_guards(e)		
	for n = 1,5 do
		match_found = false;	--reset for each loop
		local mob_list = eq.get_entity_list():GetMobList()
		
		if mob_list ~= nil then
		
			for mob in mob_list.entries do
				if guards[n] ~= -1 and guards[n].valid and mob:GetID() == guards[n]:GetID() then
					match_found = true;
				end
			end
		end
		if not match_found then
			guards[n] = eq.spawn2(214302,0,0,e.self:GetX() + math.random(-40,40), e.self:GetY() + math.random(-40,40), e.self:GetZ(), e.self:GetHeading());	--spawn or repop guards	Animated_Decorin_Blade (214302)
			eq.set_timer("depop", 5 * 60 * 1000, guards[n]);
		end
	end
end


