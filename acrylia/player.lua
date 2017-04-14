-- player.lua for Acrylia Caverns

-- makes the fancy 4-paneled door operate properly.
function event_click_door(e)
	local door = e.door:GetDoorID()
	if door == 1 or door == 2 or door == 3 or door == 4 then
		local ent_list = eq.get_entity_list()
		for i=1,4 do
			if i ~= door then ent_list:GetDoorsByDoorID(i):ForceOpen(e.self) end
		end
	end
end
