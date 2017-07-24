function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail. " .. e.other:GetName() .. "! I patrol Halas to insure the safety of the travelers and the resident clans. Just ask if you need help in finding your destination.");
	end
end