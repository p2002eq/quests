--check if any Hleytis Maor,Hleyta Menn, or Named are up
--If none alive depop and spawn real named


function event_signal(e)-- Signal from the death of any appropriate named or trash
	trash1check= eq.get_entity_list():IsMobSpawnedByNpcTypeID(210056); -- a_hleytis_maor
	trash2check= eq.get_entity_list():IsMobSpawnedByNpcTypeID(210057); -- a_hleyta_menn
	trash3check= eq.get_entity_list():IsMobSpawnedByNpcTypeID(210058); -- a_hleyta_menn
	name1check = eq.get_entity_list():IsMobSpawnedByNpcTypeID(210028);  -- Paruek_the_Strong
	name2check = eq.get_entity_list():IsMobSpawnedByNpcTypeID(210029);  -- Faruek_the_Bold

	if(not trash1check and not trash2check and not trash3check and not name1check and not name2check) then
		eq.spawn2(210231,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --Jeplak_Lord_of_Srerendi
		eq.depop_with_timer(); -- Will need to repop
	end
end


-- End of File  Zone: PoStorms ID: 210179 -- Jeplak_Lord_of_Srerendi