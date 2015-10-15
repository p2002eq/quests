function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings to you as well, "..e.other:GetName()..". Down these stairs lies the hall of our ancestors. May Brell guide my axe swiftly to the necks of those who dare attempt to desecrate such a sacred place.");
	end
end
