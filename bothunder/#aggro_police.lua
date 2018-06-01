--#aggro_police (209161)   
--bothunder
--clear aggro when player hits teleport pad in upper wings

--controller spawn locations:
--lightning pad(610,45,-1462) 
--earth pad(100,-1625,-1400)
--air pad(-45,-765,-1420)
--water pad(-975,-155,-1445)

function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	local zloc = e.self:GetZ();
	if xloc == 610 and yloc == 45 then	--lightning
		eq.set_proximity(670,723,0,45,-1465,-1455);
	elseif xloc == 100 and yloc == -1625 then	--earth
		eq.set_proximity(-45,90,-1630,-1580,-1410,-1390);
	elseif xloc == -45 and yloc == 765 then	--air
		eq.set_proximity(-140,-55,750,770,-1425,-1415);
	elseif xloc == -975 and yloc == -155 then	--water	
		eq.set_proximity(-980,-925,-75,-5,-1455,-1440)
	end
end

function event_enter(e)
	e.other:MovePCInstance(eq.get_zone_id(),eq.get_zone_instance_id(), 80, 10, -635, 0);
	eq.signal(209161,e.other:CharacterID(),1*1000); --delay on signal so will clear aggro AFTER player has been ported
	e.other:Message(15,"prox entered - aggro clearing!");	--debug 
end

function event_signal(e)
	player = eq.get_entity_list():GetClientByCharID(e.signal);
	eq.get_entity_list():RemoveFromHateLists(player:CastToMob());
end
