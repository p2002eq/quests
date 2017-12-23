#Tagrin Maldric is the blacksmith of the Zeks, and is part of obtaining Black Insanity (Zek bane) weapons. When aggro'd, he spawns 5 animated swords, who drop the actual ore for the bane weapons.

function event_combat(e)
	if e.joined and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(214119) then
		eq.spawn2(214119,0,0,e.self:GetX()-15,e.self:GetY()-15,e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(214119,0,0,e.self:GetX()+15,e.self:GetY()-15,e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(214119,0,0,e.self:GetX()-15,e.self:GetY()+10,e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(214119,0,0,e.self:GetX()+15,e.self:GetY()+10,e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(214119,0,0,e.self:GetX(),e.self:GetY()-15,e.self:GetZ(),e.self:GetHeading());
	elseif not e.joined and eq.get_entity_list():IsMobSpawnedByNpcTypeID(214119) then
		--adjust to suit for depop
		eq.set_timer("depop",10 * 60 * 1000);	--10 min depop
	end
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop_all(214119);  --depop all blades
	end
end
