-- insanity trigger (179361) in Akheva

function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 30, xloc + 30, yloc - 30, yloc + 30);
end

function event_enter(e)
	if e.other:Admin() < 100 then
		if math.random(10) == 10 then
			eq.spawn2(rare, 0, 0, -1350, -1386, 24, 0)
		end
		eq.depop_with_timer()
	end
end
