--Check if any an_irmin_her_megir,an_irmin_fannsk, Zertuken_the_Unyielding or Laruken_the_Rigid are up
--If none alive depop and spawn real named


function event_signal(e)-- Signal from the death of any appropriate named or trash
	trash1check = eq.get_entity_list():IsMobSpawnedByNpcTypeID(210015); -- an_irmin_her_megir
	trash2check = eq.get_entity_list():IsMobSpawnedByNpcTypeID(210037); -- an_irmin_fannsk
	trash3check = eq.get_entity_list():IsMobSpawnedByNpcTypeID(210038); -- an_irmin_fannsk
	name1check = eq.get_entity_list():IsMobSpawnedByNpcTypeID(210026);  -- Laruken_the_Rigid
	name2check = eq.get_entity_list():IsMobSpawnedByNpcTypeID(210027);  -- Zertuken_the_Unyielding

	if(not trash1check and not trash2check and not trash3check and not name1check and not name2check) then
		eq.spawn2(210229,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --Neffiken_Lord_Kelek-Vor
		eq.depop_with_timer(); -- Will need to repop
	end
end

-- End of File  Zone: PoStorms ID: 210176 -- Neffiken_Lord_of_Kelek'Vor