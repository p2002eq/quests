-- This quest file simply makes the fancy 4-paneled door operate properly.

function event_click_door(e)
	if e.door == 1 or e.door == 2 or e.door == 3 or e.door == 4 then
		local ent_list = eq.get_entity_list()
		ent_list:GetDoorsByDoorID(1):ForceOpen(e.self)
		ent_list:GetDoorsByDoorID(2):ForceOpen(e.self)
		ent_list:GetDoorsByDoorID(3):ForceOpen(e.self)
		ent_list:GetDoorsByDoorID(4):ForceOpen(e.self)
	end
end