function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings. disciple " .. e.other:GetName() .. ". Feel free to inspect my wares. I am here to serve all necromancers of the Dead. I can also enchant a [" .. eq.say_link("ring of the Dead") .. "] if you have one.");
	end
end