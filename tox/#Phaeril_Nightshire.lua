function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there, " .. e.other:GetName() .. ". I am currently patrolling and can not be disturbed.  After I am done with my patrol, perhaps I will speak with you.  When the night shift comes on duty, I shall be free then.");
	end
end
