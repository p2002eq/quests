function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hey you!  You watch yourself.  These items are priceless.  You break it. you buy it!");
	end
end