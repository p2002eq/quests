--#The_Tribunal_ (201423)
--pojustice
--The_Seventh_Hammer

function event_signal(e)
	if e.signal == 1 then
		e.self:CastSpell(1108,e.self:GetID());	--Verdict of Eternity
	elseif e.signal == 2 then
		e.self:CastSpell(1107,e.self:GetID());	--Tremor of Judgment
	end
end