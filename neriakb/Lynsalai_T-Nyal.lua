function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings. " .. e.other:GetName() .. ". The Neriak signal is a newspaper that reports all the events important to the Teir`Dal. which frankly. is the only news that is truly important.");
	end
end