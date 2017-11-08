-- player.lua for Acrylia Caverns


function event_click_door(e)
	
	local door = e.door:GetDoorID()
	--eq.zone_emote(14,"Door ID is: " .. door);   --debug to easily check door IDs

	
	--for Inner Acrylia floor panel in grimling warlord throne room (Opens only after first stage of Khati Sha Event Completion)
	local instance_id = eq.get_zone_instance_id();
	local qglobals = eq.get_qglobals(e.self); 
	
	if door == 5 then
		if qglobals[instance_id .. "_IAC_Seal_1"] ~= nil or e.self:GetGM() == true then 
			e.self:Message(13,"With the Wards destroyed and the seals broken the panel on the floor slides open");
		else 
			e.self:Message(13,"You notice something amiss with the floor panels at your feet; however you cannot seem to get them to move.");
			e.door:ForceClose(e.self);		
		end
	end	

	
	-- makes the fancy 4-paneled door operate properly.
	if door == 1 or door == 2 or door == 3 or door == 4 then
		if qglobals[instance_id .. "_IAC_Seal_2"] ~= nil or e.self:GetGM() == true then
			e.self:Message(13,"With the final Ward destroyed the door glides open with ease.");
			local ent_list = eq.get_entity_list()
			for i=1,4 do
				if i ~= door then ent_list:GetDoorsByDoorID(i):ForceOpen(e.self) end
			end
		else
			e.self:Message(13,"The Spirit of the final Ward holds the seal tight."); 
			e.door:ForceClose(e.self);	
		end
	end	
	
end
