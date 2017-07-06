function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("I have much work to do for the Legion of Cabilis! Have you come to view my wares, or to learn the art of weapon smithing so that you may assist me in crafting weapons for our warriors?");
	end
end