function event_target_change(e)
	if(e.self:GetTarget():GetCleanName() == "Lord Nagafen" and e.self:GetLevel() > 52 and e.self:Admin() < 80) then
		eq.zone_emote(0,"I will not fight you, but I will banish you!");
		e.self:MovePC(27,-64,262,-93.96,0);
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
