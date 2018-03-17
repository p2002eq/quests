function event_say(e)

	if (e.message:findi("hail")) then
		e.self:Say("I can place things into my vault if you so desire. "..e.other:GetName()..".");
	end

end
