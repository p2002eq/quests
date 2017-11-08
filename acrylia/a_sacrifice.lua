--a_sacrifice (154155)
--Khati Sha Event

function event_spawn(e)
	eq.set_timer("path", 2 * 1000);	--2 second delay to begin path
	eq.set_next_hp_event(50);	
end

function event_timer(e)
	if e.timer == "path" then
		eq.set_timer("loc_check",1);
		eq.move_to(433,-298,36,260,true);	--moves to #a_sarificial_cauldron
	elseif e.timer == "loc_check" then
		if e.self:GetX() == 433 and e.self:GetY() == -298 and e.self:GetZ() == 36 then
			local cauldron = eq.get_entity_list():GetMobByNpcTypeID(154096);		--target a_sacrificial_cauldron
			cauldron:CastSpell(1469,eq.get_entity_list():GetMobByNpcTypeID(154155):GetID());			--gets target of #Warder of Death to cast CH if a_sacrifice reaches itss end location
			eq.zone_emote(7,"As the sacrifice throws itself into the cauldron, the metal begins to steam as the grimling's soul prepares to empower the ward.");
			eq.depop();
		end
	elseif e.timer == "memblur" then 
		e.self:WipeHateList();
	end
end

function event_hp(e)
	if e.hp_event == 50 then
		eq.set_timer("memblur",500);	--mob will begin to memblur itself at 50% health and begin pathing back to cauldron
	end
end
