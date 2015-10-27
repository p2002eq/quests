function event_spawn(event)
	local xloc = event.self:GetX();
	local yloc = event.self:GetY();
	local zloc = event.self:GetZ();
	eq.set_proximity(xloc - 25, xloc + 25, yloc - 25, yloc + 25, zloc - 25, zloc + 25);
end

function event_enter(event)
	e.self:Say("Please, somebody help me. This bear won't let me leave.");
	e.self:Emote("tries to hide from Bloodmaw deeper in the cave.");
	eq.depop_with_timer();
end