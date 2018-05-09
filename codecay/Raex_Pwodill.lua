--Raex_Pwodill (200227)	
--Carprin Cycle (Guard of High_Priest_Ultor_Szanvon)  Mob #4 or 5 in cycle
--codecay

function event_spawn(e)
	eq.move_to(330,298,-69,127,true);	--move next to HP
end

function event_death_complete(e)
	eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 7, 300, "In a dying breath, the being in front of you cries out a final breath, cursing you to a horrid, wilting death, 'Charujnya Kleptuak KROIYA!'");
end