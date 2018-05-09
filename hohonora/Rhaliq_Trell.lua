--Rhaliq_Trell NPCID 211050
--Villager's Trial(Event Trigger NPC)
--hohonora

function event_spawn(e)
	eq.unload_encounter("Rhaliq_Trial");	--unload incase failure on last attempt
end

function event_say(e)
	if e.message:findi("Hail") then
		e.self:Emote("nods in your direction and says 'The trials have only just begun. When you're [" .. eq.say_link("ready") .. "] to be tested we shall begin.");
	elseif e.message:findi("ready") then
		e.self:Say("Good luck to you my friend...");
		eq.spawn2(211115,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());	--#A_Custodian_of_Marr (211115)
		eq.load_encounter("Rhaliq_Trial");
		eq.depop_with_timer();
	end
end