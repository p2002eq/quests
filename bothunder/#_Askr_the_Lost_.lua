--#_Askr_the_Lost_ (209154)
--Version that spawns after Emmerik_Skyfury's death
--bothunder

function event_spawn(e)
	eq.set_timer("depop", 45 * 60 * 1000);
end

function event_say(e)
	if e.message:findi("hail") then
		e.self:Say("Well done " .. e.other:GetName() .. ".  You have succeed where I have failed, but now comes the most dangerous peril the Bastion holds.  The final level of Torden holds the restless spirit of the Rainkeeper himself.  You must find a way to free him from his tormented sleep.  His dreams and visions have coalesced into a dark shade of himself which controls the full fury of the [" .. eq.say_link("Storm") .. "].");
	elseif e.message:findi("Storm") then
		e.self:Say("The spirit of chaos itself guards the chamber where Karana sleeps.  Chaos will most certain protect the embodiment of his tortured conscious as if it were the Rainkeeper himself.  I am afraid that there is no assistance that I can offer in the task laid out before you aside from opening the vortex to Chaos and offer you Karana's blessing.");
		eq.unique_spawn(209157,0,0,-1108,-1734,1740,128);	--A_Chaos_Vortex (209157)
	end
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end
