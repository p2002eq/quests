--Gurebk_Lord_of_Krendic
--Check if any a jotna fannsk,a jotna her megir,Solnebk the Unruly,Pendubk the Turbulent
--This includes BOTH desert campsnot 
--If none alive depop and spawn real named

function event_signal(e)-- Signal from the death of any appropriate named or trash
	trash1check= eq.get_entity_list():IsMobSpawnedByNpcTypeID(210030); -- a jotna fannsk
	trash2check = eq.get_entity_list():IsMobSpawnedByNpcTypeID(210035); -- a jotna fannsk
	trash3check = eq.get_entity_list():IsMobSpawnedByNpcTypeID(210022); -- a jotna her megir
	name1check = eq.get_entity_list():IsMobSpawnedByNpcTypeID(210033); -- Solnebk the Unruly
	name2check = eq.get_entity_list():IsMobSpawnedByNpcTypeID(210032); -- Pendubk the Turbulent

	if(not trash1check and not trash2check and not trash3check and not name1check and not name2check) then
		eq.spawn2(210230,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --Gurebk_Lord_of_Krendic
		eq.depop_with_timer(); -- Will need to repop
	end
end
	

-- End of File  Zone: PoStorms ID: 210178 -- Gurebk_Lord_of_Krendic