function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Lots to do! Many books to place and scrolls to file! Feel free to browse but. please. don't make a mess!");
	end
end