function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hey! What's up? If you want some real fun. go downstairs at the Maiden's Fancy.");
	end
end