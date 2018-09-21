local event_counter = 0;

function event_signal(e)
	-- signal 1 comes from my army
	if (e.signal == 1) then
		event_counter = event_counter + 1;
		if (event_counter == 12) then
			-- spawn real Bertoxxulous
			eq.spawn2(223142,0,0,-299,-297,23.3,62);
			eq.set_global(eq.get_zone_instance_id() .. "_potimeb_p5_bertox","Active",7,"H132");
			-- make myself go away!
			eq.depop();
		end
	end
end
