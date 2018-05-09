--A_storm_portal (209034)
--Agnarr the Storm Lord Event
--zone: bothunder

function event_spawn(e)
	if e.self:GetSpawnPointID() == 360317 then	
		e.self:SetBodyType(11, true);		--set untargetable
		e.self:SetSpecialAbility(35, 1);	--immune to player damage
		e.self:SetSpecialAbility(24, 1);	--will not aggro
		e.self:SetSpecialAbility(25, 1);	--immune to aggro
	end
end


function event_signal(e)
	if e.signal == 1 and e.self:GetSpawnPointID() ~= 360317 then	--middle portal doesn't spawn adds
		agnarr = eq.get_entity_list():GetMobByNpcTypeID(209026);	----Agnarr_the_Storm_Lord (209026)
		local mob_list = {209129,209130,209158,209159}
		mob = eq.spawn2(mob_list[math.random(1,table.getn(mob_list))],0,0,e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
		mob:CastToNPC():MoveTo(agnarr:GetX() + math.random(-20,20), agnarr:GetY() + math.random(-20,20), agnarr:GetZ(),agnarr:GetHeading(),true);
	end
end
