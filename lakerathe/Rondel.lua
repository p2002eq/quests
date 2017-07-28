function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello. stranger.  Are you an [" .. eq.say_link("adventurer") .. "]?");
	elseif(e.message:findi("adventurer")) then
		e.self:Say("I wish I could go off and explore the world like you.  I will spend my days as a fisherman here. I am sure.  Nothing ever happens around here though.  Well. except for the [" .. eq.say_link("other day") .. "]..");
	elseif(e.message:findi("other day")) then
		e.self:Say("I was spearfishing near the aviak construction and something amazing happened.  I was in the middle of spearing a fish when something at the bottom of the lake began to glow red.  I could swear I heard the sounds of a dragon. I did not stick around to find out what it was.");
	end
end
