--Trydan_Faye NPCID 211051
--Rydda`Dar (Event Trigger NPC)
--hohonora

function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Hello my friend. I can see that you've journeyed far to come before me. You've passed your first task, but you have many more [" .. eq.say_link("Trials") .. "] to face before you can enter the Temple of Marr.");
	elseif e.message:findi("Trials") then
		e.self:Say("There are three other Trials you must undergo before you can prove yourself worthy. When you're [" .. eq.say_link("ready") .. "] we'll begin the first Trial.");
	elseif e.message:findi("ready") then
		e.self:Say("Good luck my friends.");
		eq.spawn2(211121,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --#_A_Custodian_of_Marr
		eq.depop_with_timer();
	end
end