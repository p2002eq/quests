--Avhi_Escron (200224)
--Carprin Cycle (2nd named in Cycle)
--codecay

function event_spawn(e)
	eq.depop_all(200265); --#Reanimated_Reaver (200265) if happen to be spawned
	spawn_adds(e)
end

function event_combat(e)
	if e.joined then
		eq.stop_timer("reset");
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 7, 300, "Piercing ebony eyes see through to your soul and then the dark being standing before you speaks the mystic symbols of a summoning spell in a long lost ancient language. The creature then turns towards you and says, 'Ah we have guests I see. How kind of Carprin to let you visit me I so hope I do prove to be entertaining.'");
	else
		eq.set_timer("reset", 60 * 1000);
	end
end

function event_timer(e)
	if e.timer == "reset" then 
		if not e.self:IsEngaged() then
			eq.stop_timer(e.timer)
			eq.depop_all(200265);
			spawn_adds(e);
		else
			eq.set_timer("reset", 3 * 1000);  --check for reset in 3 min
		end
	end
end

function event_slay(e)
	if e.other:IsClient() or e.other:IsPet() then
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 7, 300, "Maniacal laughter echoes around the room as the ancient dark lich uses the freshly dead body to summon forth even more reanimated reavers.");
		spawn_adds(e)
	end
end

function event_death_complete(e)
	eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 7, 300, "The menacing voice is heard once again saying, 'Betrayer and desecrator of storms I call upon you to end the lives of these fools.");
	eq.depop_all(200265);	--#Reanimated_Reaver (200265)
	eq.unique_spawn(200225,0,0,256,80,-69,0);	--spawn Bishop_Toluwon (200225)
end

function spawn_adds(e)	----#Reanimated_Reaver (200265)
	eq.spawn2(200265,0,0,(e.self:GetX() + 12),e.self:GetY() + 12,e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(200265,0,0,(e.self:GetX() - 12),e.self:GetY() - 12,e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(200265,0,0,e.self:GetX() + 12,(e.self:GetY() - 12),e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(200265,0,0,e.self:GetX() - 12,(e.self:GetY() + 12),e.self:GetZ(),e.self:GetHeading());
end