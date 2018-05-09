--The_Seventh_Hammer (201074)
--pojustice

local dialogue = false;
local verdict = false;

function event_spawn(e)
	dialogue = false;
	verdict = false;
end

function event_say(e)
	if e.message:findi("hail") then
		e.self:Say("Greetings, mortal. It seems the council has deemed you worthy of the challenge, are [" .. eq.say_link("I am ready to face judgment",false,"you ready to face judgment?") .. "]");
	elseif e.message:findi("ready to face judgment") then
		e.self:Say("Very well, mortals. Now begins the test of your very souls!");
		dialogue = true;
		e.self:AddToHateList(e.other,1);
	end
end

function event_combat(e)
	if e.joined and not dialogue then
		e.self:Say("Prepare for judgment, mortals!");
		eq.set_timer("tribunal",10 * 1000);
	else
		dialogue = false;
		verdict = false;
		eq.stop_timer("tribunal")
	end
end

function event_timer(e)
	if e.timer == "tribunal" then
		eq.stop_timer(e.timer);
		eq.set_timer("tribunal", 75 * 1000);	--first cast is quick
		eq.signal(201427,1);		--signal Tribunal Casting Emote
		
		if verdict then	--alternating spells sequence
			verdict = false;
			eq.signal(201423,1,1600);	--signal Verdict of Eternity via #The_Tribunal_ (201423)
		else
			verdict = true;
			eq.signal(201423,2,2200);	--signal Tremor of Judgment nuke via #The_Tribunal_ (201423)
		end
	end
end