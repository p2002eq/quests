--Bishop_Toluwon (200225)
--Carprin Cycle (3rd named in Cycle)
--codecay

function event_spawn(e)
	eq.spawn2(eq.ChooseRandom(200245,200261,200262,200263),0,0,274,100,-69,192)	--spawn guards (FireBone Archmagus, Priest/Knight/Necromancer of Decay)
	eq.spawn2(eq.ChooseRandom(200245,200261,200262,200263),0,0,246,100,-69,64)
end

function event_death_complete(e)
	eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 7, 500, "A raspy voice is heard as the High Priest begins to speak, 'You have come far to seek your demise. Raex! Vindor! My generals to me. Slay these infidels in the name of our lord the Plaguebringer.'");

	eq.unique_spawn(200228,0,0,309,322,-69,127.5);	--High_Priest_Ultor_Szanvon (200228)
	eq.unique_spawn(200227,0,0,433,298,-76,192);	--Raex_Pwodill (200227)	
	eq.unique_spawn(200226,0,0,217,298,-64,64);	--Vindor_Mawnil (200226)
end



