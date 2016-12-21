function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings! I am Jaylin Monel, your Highkeep bank clerk. If you are here to close an account, please return your strongbox key to my assistant Kiolna and she will return any items you may have stored.");
	end
end
