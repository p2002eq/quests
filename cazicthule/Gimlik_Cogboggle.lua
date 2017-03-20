function event_say(e)
	if not event then
		if e.message:findi("hail") then
			e.self:Say("Well met, noble soul! I'm Gimlik Cogboggle. You are correct, the Gimlik Cogboggle, renowned adventurer, scholar, and yes... creator of spells. Please don't goggle or touch. Your opportunity has arrived, my friend. I was sent here to complete a very important task and for that, I will need some slight assistance. If you will be kind enough to follow me, I'll show you to your doom... err... get this show on the road. Just let me know when you're [ready].");
		elseif e.message:findi("ready") then
			e.self:SetNPCFactionID(1006);
			e.self:AssignWaypoints(112);
			e.self:Say("Well look at you! You see, you're off to a great start! Now, just follow me and yell out if something stabs you or maims you in anyway. Never fear, I've memorized gate and have complete confidence in your ability to fend off danger for at least five seconds. Follow me... follow me.");
		end
	end
end