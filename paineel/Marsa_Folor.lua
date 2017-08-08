function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there. " .. e.other:GetName() .. "!  Can't take your valuables with you?  Weighing you down. are they. " .. e.other:GetName() .. "?  Leave them with me.  In my capable hands and in the hands of my capable staff. they will be safe from prying eyes and quick hands!");
	end
end