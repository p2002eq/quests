--Iramai_Sacredsoul (203432)
--potranquilty

--Quest NPC for Plane of Torment Alt Access - which is currently unavailable on P2002 due to being out of era.

function event_say(e)
	if e.message:findi("hail") then
		e.self:Say("Oh, hello. I am sorry, I did not see you approach. I have been giving all of my attention to poor Phanti here.")
	end
end

function event_signal(e)
	e.self:Say("Oh, hello. I am sorry, I did not see you approach. I have been giving all of my attention to poor Phanti here.");
end
