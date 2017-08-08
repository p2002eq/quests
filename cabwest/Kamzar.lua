function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Much beauty can be found upon the skins of our enemies.  And... even upon that of our own allies?");
	end
end