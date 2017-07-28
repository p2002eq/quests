function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetin's! I've many fine herbs and potions fer sale. Please look around.");
	end
end
