function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome! It is good to see our disciples can still outsmart the guards of Qeynos and make it to the Shrine of Bertoxxulous. Our ranks are best filled with disciples such as yourself. We have need of you. Do you wish to serve the [" .. eq.say_link("Lord of Disease") .. "] or not?");
	elseif(e.message:findi("lord of disease")) then
		e.self:Say("Aye! That is good. Of late, we have heard news of a message that will be sent to the Treefolk of the Jaggedpine. Antonius Bayle will send word to the Jaggedpine that certain requests will be met. We must intercept this message. That is all you need to know. Go and find Antonius Bayle's messenger, Gharin, He should have the message. Get it by any means necessary and return it to me. Go now!");
	end
end