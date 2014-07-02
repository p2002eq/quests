function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello my friend, you need some [plat] ?");
	elseif(e.message:findi("plat")) then
		e.self:Say("have fun");
		e.other:GiveCash(100,0,0,0);
	end
end