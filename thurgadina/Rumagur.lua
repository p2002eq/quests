function event_signal(e)
	if (e.signal ==1) then
		e.self:Say("Hey Fronden, I want a double of whatever you've been serving him!");
		eq.signal(115013, 1, 9000)
	elseif (e.signal == 2) then
		e.self:SetRunning(true);
		eq.start(7);
	elseif (e.signal == 3) then
		e.self:Say("Aye Sara, much better indeed. With the help of good Fronden here I think I've finally figured out what was causing the alarming condition under me left arm. I must admit it was givin me quite a scare for a while, not to mention the pain was drivin me to drink.");
		eq.signal(115010, 4, 8000);
	elseif (e.signal == 4) then
		e.self:Say("Every day I come here to wet me whistle and I stand in the same spot, facin' the same way. As yer good wares take effect on me I lean more and more upon the bar here. The constant pressure was causin' me to develop... well... barsores. So I'll just have to face the other way from now on.");
		e.signal(115014, 2, 8000);
	elseif (e.signal == 5) then
		eq.signal(115014, 3);
	elseif (e.signal == 6) then
		eq.signal(115014,4,50000);
	elseif (e.signal == 7) then
		eq.signal(115014, 5, 50000);
	elseif (e.signal == 8) then
		e.self:Say("Say, Fronden, ya got anything stronger lyin' around back there?");
		eq.signal(115014, 6, 8000);
	elseif (e.signal == 9) then
		e.self:Say("I'd be honored to try your family recipe. Thank ye.");
		eq.signal(115014, 7, 8000);
	elseif (e.signal == 10) then
		e.self:Emote("looks at Fronden through crossed eyes and whispers hoarsely, 'Smooth'.");
	end
	
end

function event_waypoint_arrive(e)
	if (e.wp == 4) then
		e.self:SetRunning(false);
	elseif (e.wp == 9) then
		eq.stop();	
	end
end
