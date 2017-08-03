function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Oh. hello there. " .. e.other:GetName() .. "!  I have been absolutely slaving all day to choose a new [" .. eq.say_link("advertisement") .. "] for my wonderful store here.  Care to hear what I have?");
	elseif(e.message:findi("advertisement?")) then
		e.self:Say("Excellent!  Here goes.  Come to Pardas Nalue's Sinfully Handsome Tailor!  You can get everything you need to be just as good looking as Pardas.  Well. almost everything!  So. do you [" .. eq.say_link("like it") .. "]?");
	elseif(e.message:findi("like it") or e.message:findi("absolutely fabulous")) then
		e.self:Say("I just knew you would!  Come on folks. let's watch the money just come pouring in!  Isn't this absolutely fabulous?!");
	end
end