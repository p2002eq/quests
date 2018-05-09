--#an_executioner (201469)
--Trial of Execution
--pojustice

local final_wp = false;

function event_spawn(e)
	eq.set_timer("monitor",100);
	final_wp = false;
end

function event_signal(e)
	if e.signal == 0 then 	--signals from trash mob death to reset path
		if trash_check() then
			e.self:GMMove(193,-1045,75,254);
			e.self:MoveTo(193,-1045,73,-1,true)
			final_wp = false;
			eq.stop_timer("DT");
		else
			eq.signal(201471,9); --#Event_Execution_Control (201471) - signal next round start
			eq.depop();	--trash check was false so depopping until next round spawns
		end
		
	--increases executioner walk speed based on wave.  Base runspeed is 1.1 for Executioner
	elseif e.signal == 1 then
		e.self:ModifyNPCStat("runspeed","1.1");
		eq.set_timer("path", 1);
	elseif e.signal == 2 then
		e.self:ModifyNPCStat("runspeed","1.3");
		eq.set_timer("path", 1);
	elseif e.signal == 3 then
		e.self:ModifyNPCStat("runspeed","1.5");
		eq.set_timer("path", 1);
	elseif e.signal == 4 then
		e.self:ModifyNPCStat("runspeed","1.7");
		eq.set_timer("path", 1);
	end
end

function trash_check()
	local wave_mobs	= { 201464, 201465, 201466, 201467 }; -- possible mobs in wave
	for n = 1,4 do
		local mob_list = eq.get_entity_list():GetMobList();
		if mob_list ~= nil then
			for mob in mob_list.entries do
				if mob:GetNPCTypeID() == wave_mobs[n] then
					return true;
				end
			end
		end
	end
	return false;	--no trash found
end

function event_timer(e)
	if e.timer == "monitor" then
		if (e.self:GetX() == 193) and (e.self:GetY() == -1045) then
			e.self:MoveTo(193,-1159,82,-1,false);
		elseif (e.self:GetX() == 193) and (e.self:GetY() == -1159) then
			e.self:MoveTo(172,-1159,82,127,true);
		elseif (e.self:GetX() == 172) and (e.self:GetY() == -1159) and not final_wp then
			final_wp = true;
			e.self:Emote("intones, 'Do you have any final words before your sentence is carried out?'")
			eq.signal(201468,0, 2 * 1000);	--#a_sentenced_prisoner (201468)
			eq.set_timer("DT", 15 * 1000);
		end
	elseif e.timer == "path" then
		eq.stop_timer(e.timer);
		e.self:MoveTo(193,-1045,73,-1,true);
	elseif e.timer == "DT" and final_wp then
		eq.stop_timer(e.timer);
		e.self:Say("Very well.")
		local prisoner = eq.get_entity_list():GetMobByNpcTypeID(201468);
		e.self:CastSpell(982,prisoner:GetID());	--Cazic Touch
		eq.set_timer("depop", 5 * 1000);
	elseif e.timer == "depop" then
		eq.depop();
	end
end
