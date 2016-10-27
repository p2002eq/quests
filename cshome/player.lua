function event_say(e)
	if(e.message:findi("haste")) then
	    e.self:Say(tostring(e.self:GetHaste()));
	end
end