function event_signal(e)
	if(e.signal == 99) then
		e.self:DoAnim(43)
		e.self:Emote("breathes quickly and sweats as he channels his spirit into the sky.");
	end
end