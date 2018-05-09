--A_warm (207278) in Plane of Torment(FLAVOR)

function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	local zloc = e.self:GetZ();
	eq.set_proximity(xloc - 35, xloc + 35, yloc - 35, yloc + 35, zloc - 20, zloc + 20);
end

function event_enter(e)
	e.self:Emote("red mist falls from above.  The slick substance has no time to settle before it is hungrily absorbed by every surface.");
	eq.depop_with_timer();
end



