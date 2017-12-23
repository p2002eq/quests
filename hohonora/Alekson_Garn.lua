function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Weakling! How dare you approach me.  Access to Lord Marrs temple is reserved only for the honorable!  You will never be [" .. eq.say_link("ready") .. "]...");
	elseif e.message:findi("ready") then
		e.self:Say("Be warned, " .. e.other:GetName() .. ", if you believe you are ready, you will fail, even if you can kill Lord Marrs servants!");
		eq.spawn2(211076,0,0,(e.self:GetX() - 50),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --A_Custodian_of_Marr_
		eq.signal(211081,4,1);
		eq.depop_with_timer();
	end
end