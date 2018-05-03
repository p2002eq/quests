--#arbitor_controller (218394)
--Controller for Mystical Arbitor of Earth
--poeartha

function event_signal(e)
	eq.GM_Message(18,"Signal!")
	local qglobals = eq.get_qglobals();
	local instance_id = eq.get_zone_instance_id();
	local started = tostring(instance_id .. "_Arbitor_PoEarthA_started");
	local ringcount = tostring(instance_id .. "_Arbitor_PoEarthA_ringcount");
	local arbitor = tostring(instance_id .. "_Arbitor_PoEarthA_cooldown");
	local counter = 0;

	
	if qglobals[started] == nil then 
		eq.set_global(started, "1",3,"D2");	--48 hrs to complete 4 rings or it resets
		eq.set_global(ringcount, "1",3,"D3");
		--eq.GM_Message(13,string.format("Arbitor ring qglobal is now started! Ring Count: [%s]",qglobals[ringcount]))
	elseif qglobals[started] ~= nil and tonumber(qglobals[ringcount]) > 0 then
		counter = tostring(tonumber(qglobals[ringcount]) + 1); 
		eq.set_global(ringcount,counter,3,"D3");
		--eq.GM_Message(13,string.format("Ring Count: [%s]",tonumber(qglobals[ringcount])))
	end
	
	if tonumber(counter) == 4 and qglobals[arbitor] == nil then
		eq.unique_spawn(218363,0,0,e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());	--#A_Mystical_Arbitor_of_Earth (218363)
		eq.set_global(arbitor,"1",3,"D3");
		eq.GM_Message(15,"Mystical Arbitor of Earth triggered!");
		--eq.GM_Message(13,string.format("Arbitor triggered!:  Qglobal value [%s]",qglobals[arbitor]))
		eq.delete_global(started);
		eq.delete_global(ringcount);
	elseif tonumber(counter) >= 4 then	--reset if flagcount exceeds 4
		eq.delete_global(ringcount);
		eq.delete_global(started);
	end	
end




