local peek;
local count;

function event_spawn(e)
	peek = false;
	count = 0;	--will send max of 2 groups up
end

function event_say(e)
	local zone_id = eq.get_zone_id();
	local instance_id = eq.get_zone_instance_id();
	local group = e.other:GetGroup();
	local raid = e.other:GetRaid();
	
	if e.message:findi("hail") then
		e.self:Emote("looks at you with eyes wide with fear. 'Who.. who are you? You.. You must [" .. eq.say_link("help") .. "] me!");
	elseif e.message:findi("help") then
		e.self:Say("The forest, it.. I can feel it looking at me.. following me! Oh, I just want to [" .. eq.say_link("leave") .. "] and go!");
	elseif e.message:findi("leave") then
		e.self:Say("I don't know what it could be, I was just walking home and.. and.. this doesn't look like the forest near my home at all! Oh, and I am wearing my mother's [" .. eq.say_link("Locket of Escape") .. "].. but it won't work for me!");
	elseif e.message:findi("locket of escape") then
		e.self:Say("My mother always carried this with her. I have no idea why I suddenly have it. Perhaps I can make it work for you, if you [" .. eq.say_link("I want you to", false, "want") .. "]?");
	elseif e.message:findi("want") then
		if not peek then
			e.other:MovePCInstance(204,instance_id,1194,1121,280,360);
			e.self:Say("Oh it worked!  Are you still here?  Oh, please, don't have left me.  Come tell me you are still [" .. eq.say_link("I'm still here",false,"here") .. "]!");
			peek = true;
		else
			e.self:Say("Hmm.. It doesn't seem to want to work. Do you see [" .. eq.say_link("I see Deyid", false, "Deyid") .. "]?")
		end
	elseif e.message:findi("here") and peek then
		e.self:Say("What did you see?");
	elseif e.message:findi("Deyid") then
		e.self:Say("Ohh, that must be what is causing all this trouble! You all seem so brave. Maybe if you chop down Deyid the Twisted I will be able to go home? Will you please? If you have gathered together and are prepared, have your leaders step forward and [" .. eq.say_link("We are ready", false, "tell me their readiness") .. "]. Mother's Locket doesn't seem as bright as it was before. I fear I can only use it but a couple more times.")
	elseif e.message:findi("ready") and ( group:IsLeader(e.other) or raid:IsGroupLeader(e.other:GetName()) ) then
		if count < 2 then	
			if e.other:IsRaidGrouped() then 
				raid:TeleportGroup(e.other, zone_id, instance_id, 1194,1121,280,-1, raid:GetGroup(e.other:GetName()));
				count = count + 1;
			else
				group:TeleportGroup(e.other, zone_id, instance_id, 1194,1121,280,-1);
				count = count + 1;
			end
			eq.set_timer("reset", 30 * 60 * 1000);
		else	--locked out - max of 2 groups met
			e.self:Say("Oh, I am sorry I can't make it work any more!  I do hope those that are up on the plateau will be sufficient to overcome the big tree!");
		end
	end
end

function event_timer(e)
	if e.timer == "reset" then	--added in event of failure to allow an other group to participate in event
		peek = false;
		counter = 0;
	end
end

function event_signal(e)
	if e.signal == 1 then
		e.self:Shout("Oh thank you! Thank you! I don't feel the trees watching me anymore! And.. Let me try Mother's Locket again, I think it might work..");
		eq.depop_with_timer();
	end
end
