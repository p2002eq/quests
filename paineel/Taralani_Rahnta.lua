function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings. " .. e.other:GetName() .. ".  You have found the only place to purchase liquor in this fine city.  It seems that many of my countrymen do not appreciate liquor as I do.  Fear not if you spill. I have plenty of [" .. eq.say_link("skeletal servants") .. "] to clean up the mess.");
	elseif(e.message:findi("skeletal servants")) then
		e.self:Say("Can't you see. child?  These dead servants of mine are bussing tables and dancing!  They work incredibly cheaply.  Heh.  Don't try to harm them. though. they don't like that very much. Say. would you like to see something interesting?");
	end
end