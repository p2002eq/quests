function event_waypoint_arrive(e)
	if (e.wp == 1) then	
		e.self:Say("My beloved brethren! Hear me now, I have seen a sacred vision...");
		eq.signal(115011,1);
		eq.signal(115187,1);
	elseif (e.wp == 2) then
		e.self:Say("Uh oh");
		e.self:IsRunning(true);	
		eq.signal(115011,2);
		eq.signal(115187,2);
		eq.signal(115010,3);
		eq.signal(115012,2);
		eq.signal(115188,2);
	elseif (e.wp == 19) then
		e.self:IsRunning(false);
		e.self:Say("Whew, that was a close one!");
		eq.signal(115142,1);
	elseif (e.wp == 40) then
		e.self:SetAppearance(1);	
	end
end

function event_signal(e)
	if (e.signal == 1) then
		e.self:Say("In my vision, Brell himself spoke to me! He indicated that the path to true enlightenment could only be found through sobriety. Substances such as alcohol only serve to cloud the mind and keep us from our true destiny!");
		eq.signal(115010,1);
		eq.signal(115014,1);
	elseif (e.signal == 2) then
		e.self:Say("Mock me if you will brothers, I am off to seek audience with the Dain where I will convince him of the evils of liquor. I am sure he will have our taverns serving only water and juice by day's end.");
		eq.signal(115010,2);
		eq.signal(115012,1);
		eq.signal(115188,1);
	elseif (e.signal == 3) then
		e.self:Say("I had a sacred vision from Brell himself!");
		eq.signal(115142,2);
	elseif (e.signal == 4) then
		e.self:Emote("thinks for a moment, looking at the roomful of rugged patrons,");
		eq.signal(115142,3);
	elseif (e.signal == 5) then
		e.self:Say("Heh, I saw meself here at Doogie's Drinks partaking of the finest Coldain ale in the land, of course!");
		eq.signal(115142,4);
	end
end
