local event_counter = 0;

function event_signal(e)
	-- signal 1 comes from my army
	if (e.signal == 1) then
		event_counter = event_counter + 1;
		if (event_counter == 12) then
			-- spawn real Innoruuk
			eq.spawn2(223167,0,0,303.3,306,13.3,323);
			eq.set_global(eq.get_zone_instance_id() .. "_potimeb_p5_inny","Active",7,"H132");
			-- make myself go away!
			eq.depop();
		end
	end
end
