function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Eh?  Eh?!  Talk not now!  My [" .. eq.say_link("creation") .. "] is running wild!  Destroy it for me. please!  If you do you can keep whatever parts you want from it.");
	elseif(e.message:findi("what creation")) then
		e.self:Say("Did you kill it yet? What?  Bah!  Yes. I made it.  Nilit's clockwork it is.  I made it to carry my toys to and from Ak'Anon but now it's gone wild and started attacking people.  Please. destroy it!");
	end
end