function event_spawn(e)
	eq.set_timer("talk",600000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, friend. I am visiting from the plains. I hope to make a FORTUNE here in Qeynos.");
	elseif(e.message:findi("Flockwalker")) then
		e.self:Say("Gash Flockwalker is a druid from Surefall Glade. I have a [" .. eq.say_link("special delivery") .. "] for him.");
	elseif(e.message:findi("special delivery")) then
		eq.attack(e.other:GetName());
	end
end

function event_timer(e)
	if(e.timer == "talk") then
		e.self:Say("Pardon me.  Have you seen a man named Gash [" .. eq.say_link("Flockwalker") .. "]?  He hails from Surefall Glade.");
		eq.stop_timer("talk");
		eq.signal(1104,2);
	end
end
