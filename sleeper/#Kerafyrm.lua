--Kerafyrm event aggro script

function event_spawn(e)
	eq.set_timer("massacre", 10*1000);  --10 second aggro checks
    eq.set_timer("depop", 4*60*60*1000);	--set depop timer for 4 hours
end

function event_timer(e)
    if(e.timer == "massacre") then
		local clientList = eq.get_entity_list():GetClientList();		--selects all clients in zone
		if ( clientList ) then
			for client in clientList.entries do
				if (client:GetGM() == false) then
					e.self:AddToHateList(client);		--adds each PC to hatelist if not a GM
				end
			end
		end
    elseif(e.timer == "depop") then
		eq.stop_timer("depop");
		eq.depop();
	end
end

function event_slay(e)
	e.self:Shout("Begone insect, I have much slaying yet to do!");
end
	