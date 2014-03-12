function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("ignores you.");
	elseif(e.message:findi("challenge eejag")) then
		eq.spawn(27119,0,0,298,1037,-232);
		eq.depop_withtimer();
	end
end
