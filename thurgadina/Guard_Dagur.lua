function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings and welcome to Thurgadin, "..e.other:GetName()..". Ye best watch yer step on the bridge there, it can be a bit slippery.");
		eq.signal(115132, 1);
	end		
	--changed quest to use signals and not use entity list to make Guard Baldvin talk

end
