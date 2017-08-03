function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Huh? Oh hi " .. e.other:GetName() .. ". Youse want to buy sumthin?");
	end
end
