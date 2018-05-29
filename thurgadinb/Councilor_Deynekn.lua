--Councilor_Deynekn (129074)
--thurgadinb

function event_say(e)
	if (e.message:findi("hail")) then
		e.self:Emote("smells strongly of ale. Councilor Deynekn says, '-hic-, whoa there lad, ye startled me! I'm uhhh -hic- just tired is all. Leave me -hic- be please. I've got umm important work to do! -hic-'");
	end
end

function event_signal(e)
	if(e.signal == 1) then --Night
		e.self:SetCurrentWP(0);
		eq.start(44);
		--eq.move_to(92,703,39,131,true);
	elseif(e.signal == 2) then --Day
		e.self:SetCurrentWP(0);
		eq.start(43);
	--eq.move_to(20,534,68,0,true);
	end
end
