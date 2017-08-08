function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetName() .. ". The Mining Journal has all the news fit fer dwarven eyes to feast upon.");
	end
end
