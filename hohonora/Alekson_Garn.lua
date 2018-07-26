--Alekson_Garn (NPCID: 211060)
--Trial of Maidens (Event Trigger NPC)
--hohonora

function event_spawn(e)
	eq.unload_encounter("Alekson_Trial");	--unload incase failure on last attempt
	trial = false;
end

function event_say(e)
	if e.message:findi("hail") then
		e.self:Say("Greetings, young " .. e.other:GetName() .. ". I can see by the look in your eyes that you're [" .. eq.say_link("ready") .. "] to begin the Trials.");
	elseif e.message:findi("ready") then
		e.self:Say("Good luck my friend. You'll need it.");
		if not trial then
			trial = true;
			eq.unique_spawn(211114,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --#A_Custodian_of_Marr (211114)
			eq.load_encounter("Alekson_Trial");
		end
		eq.depop_with_timer();
	end
end

