function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("It is best for you to buy some of my armor.  It is far better than anything a lizard could create on his own.  You do the adventuring and leave the stitching to good old Scaznar.  Tailoring is my rebirth.");
	end
end