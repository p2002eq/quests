function event_spawn(e)
	e.self:SetAppearance(1);
end

function event_waypoint_arrive(e)
	if (e.wp == 1) then
		e.self:Emote("belches");
		e.self:SetAppearance(1);	
	elseif (e.wp == 23) then
		e.self:Say("Hullo, Petcas. Four dwarven ales please. Line 'em up for me, I need to knock 'em down quick.");
		eq.signal(115141,1,8000);
	elseif (e.wp == 45) then
		e.self:SetAppearance(1);	
	end
end

function event_signal(e)
	if (e.signal == 1) then
		e.self:Say("Long story, Pet. I was studying with Grand Historian Thoridain's daughter last week. Outta nowhere she came and kissed me right on the mouth! Just then her father walked in and wouldn't listen when I tried to explain.");
		eq.signal(115141,2,8000);
	elseif (e.signal == 2) then
		e.self:Say("He went and told the Dain himself! I was summoned to the throne the next day where his highness sentenced me to a month of Thoridain's sermons. I just now managed to sneak away for a little refreshment.");
		eq.signal(115141,3,4000);
	elseif (e.signal == 3) then
		e.self:Emote("hiccups!");
		eq.signal(115141,4,3000);
	elseif (e.signal == 4) then
		eq.signal(115141,5,8000);
	elseif (e.signal == 5) then
		e.self:Say("Thank ye, Pet. Yer most kind.");
		eq.signal(115141,6,7000);
	end
end
