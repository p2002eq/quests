-- This quest file simply makes the fancy 4-paneled door operate properly.

function event_click_door(e)
	local door = e.door:GetDoorID()
	if door == 1 or door == 2 or door == 3 or door == 4 then
		local ent_list = eq.get_entity_list()
		ent_list:GetDoorsByDoorID(1):ForceOpen(e.self)
		ent_list:GetDoorsByDoorID(2):ForceOpen(e.self)
		ent_list:GetDoorsByDoorID(3):ForceOpen(e.self)
		ent_list:GetDoorsByDoorID(4):ForceOpen(e.self)
	end
end