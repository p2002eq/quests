-- a tae ew Justicar in Cazicthule
function event_signal(e)
	if e.signal == 99 then
		if (e.self:GetZ() > -100) and (e.self:GetZ() < -90) then
			e.self:SpellFinished(2127, e.self); -- Tragedy at Cazic Thule
			e.self:Depop();
		end
	end
end