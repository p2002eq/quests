function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Good day to you. " .. e.other:GetName() .. "! If you are looking for fishing supplies. you've come to the right place. And if you have a successful day. I will gladly pay for your catch.");
	end
end
