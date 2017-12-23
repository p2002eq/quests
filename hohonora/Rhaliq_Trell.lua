function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Weakling! How dare you approach me.  Access to Lord Marrs temple is reserved only for the honorable!  You will never be [" .. eq.say_link("ready") .. "]...");
	elseif e.message:findi("ready") then
		e.self:Say("Be warned, " .. e.other:GetName() .. ", if you believe you are ready, you will fail, even if you can kill Lord Marrs servants!");
		eq.spawn2(211088,0,0,526,1375,-115,e.self:GetHeading());
		eq.depop_with_timer();
	end
end