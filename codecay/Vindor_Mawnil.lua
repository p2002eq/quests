--Vindor_Mawnil (200226)
--Carprin Cycle (Guard of High_Priest_Ultor_Szanvon)  Mob #4 or 5 in cycle
--codecay

function event_spawn(e)
	eq.move_to(291,298,-69,127,true);	--move next to HP
end

function event_death_complete(e)
	eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 7, 300, "The essence of decay has been quelled in this being, its lifeless form falls to the ground.");
end