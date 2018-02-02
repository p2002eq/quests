--#Punisher_of_Flame_ (201504)
--Trial of Flame
--pojustice

local AE_time = 30000; -- 30 sec
local AE_spells = {1281,1131, 951}; 	--Searing Flames, Wave of Heat, Fiery Death

function event_timer(e)
	if (e.timer == "AE_timer") then
		e.self:CastSpell(AE_spells[math.random(2,3)],e.self:GetID());  --Wave of Heat or Fiery Death
	end
end

function event_signal(e)
	e.self:CastSpell(AE_spells[1],e.self:GetID());  --Searing Flames opening AE
	eq.set_timer("AE_timer", AE_time);
end