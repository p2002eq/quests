local player_list = nil;
local player_list_count = nil;
local entity_list = nil;
local client_e = nil;

function event_click_door(e)
    e.self:Message(15, "testtesttest 1");
    entity_list = eq.get_entity_list(); --get current entity list of zone
	e.self:Message(15, "test 2");
	local door_id = e.door:GetDoorID(); 
    e.self:Message(15, "test 3");
	client_e = e;
    e.self:Message(15, "test 5");
	player_list = nil;
	e.self:Message(15, "test 6");
	player_list_count = nil;
	e.self:Message(15, "test 7");
end