--Fyking_Baer
--ID:208069
--Zone:povalor 

function event_say(e)
	if e.message:findi("hail") then
		e.self:Emote("looks bored. 'This isn't what I signed up for! Distributing [" .. eq.say_link("weapons") .. "]? Bah!");
	elseif e.message:findi("weapons") then
		e.self:Say("These weapons, fool.  I signed up for [" .. eq.say_link("Ducee Lealson") .. "] for the honor of battle, not to sit in a tent guarding toys.");
	elseif e.message:findi("Ducee Lealson") then
		e.self:Say("We are Ducee Lealson! I don't understand why we would be assigned to this duty, we just returned from a successful campaign.  This is a waste of our talents.");
		eq.signal(208014,2);	--Sergeant_Gerrin_Bakeside
	end
end

function event_signal(e)
	e.self:Say("Sorry Sir!");
end

