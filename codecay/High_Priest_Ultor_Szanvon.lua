--High_Priest_Ultor_Szanvon (200228)
--Carprin Cycle (Final Mob in cycle)
--codecay

function event_death_complete(e)
	eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 7, 300, "Dead silence reigns throughout the crypt as the heroes stand victorious over the High Priests lifeless body. Moments later a soft almost inaudible voice echoes through your mind whispering, 'Free us. Free us you must.' Then a wretched creatures appears out of nowhere, shaking and muttering gibberish.");
	eq.spawn2(200229,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());	--Tarkil_Adan (200229)
end
