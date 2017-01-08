-- a tae ew Justicar in Cazicthule

function event_signal(e)
	if e.signal == 99 then
		e.self:Shout("ZLOC IS " .. e.self:GetZ);
		if e.self:GetZ() > -100 and e.self:GetZ() < -90 then
			e.self:SpellFinished(2127, self);
			e.self:Depop();
		end
	end
end