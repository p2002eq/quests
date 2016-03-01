local player_list = nil;
local player_list_count = nil;
local entity_list = nil;
local client_e = nil;

function event_click_door(e)
    entity_list = eq.get_entity_list(); --get current entity list of zone
	e.self:Message(15, "test 2");
	local door_id = e.door:GetDoorID(); 
    e.self:Message(15, "3Door ID: " .. door_id));
	client_e = e;
    e.self:Message(15, "test 4");
	player_list = nil;
	e.self:Message(15, "test 5");
	player_list_count = nil;
	e.self:Message(15, "test 6");
	if (e.other:HasItem(5532) == 1) then
	    e.self:Message(15, "has epic");
	end
	if (e.self:HasItem(5532)) then
	    e.self:Message(15, "epic has");
	end
end