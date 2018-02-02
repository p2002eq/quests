--#a_sentenced_prisoner (201513)  -- Aviak
--Trial of Hanging
--pojustice

local stage = 0;

function event_signal(e)
	if e.signal == 1 then
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()},7,150,"The prisoner begins to choke as an invisible noose tightens around its neck.");
		e.self:GMMove(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 127, true);
		eq.set_timer("noose",14 * 1000);
		stage = 0;
	elseif e.signal == 5 then  
		eq.stop_all_timers();
		e.self:GMMove(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 255, true);
		e.self:SetAppearance(0);
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()},7,150,"The prisoner gasps, taking in large breaths and coughing as the invisible noose disappears.");
	end
end

function event_timer(e)	--Total timer before prisoner dies = 42 seconds
	if e.timer == "noose" then
		stage = stage + 1;
		if stage == 1 then
			eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()},7,150,"The prisoner clutches at its throat, trying desperately to breathe.");
		elseif stage == 2 then
			e.self:SetAppearance(3);
			eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()},7,150,"The prisoner falls to the ground, legs kicking and fingers clawing at its throat.");
		elseif stage == 3 then
			eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()},7,150,"The prisoner gives one final twitch and suddenly becomes still, its limbs no longer flailing.  You have failed.");
			eq.signal(201509,2);	--#Event_Hanging_Control (201509) -- FAIL
			eq.depop();
		end
	end
end

function event_death_complete(e)
	eq.signal(201509,2);	--#Event_Hanging_Control (201509) -- FAIL
end



