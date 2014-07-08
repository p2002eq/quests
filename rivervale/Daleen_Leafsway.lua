function event_spawn(e)
	eq.set_timer("blurt",600000);
end

function event_say(e) 
	local faction = e.other:GetFaction(e.self);
	
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Greetings. %s!  Welcome to Tagglefoot's Farm.  We grow nothing but the finest vegetables in our field.  We even manage to harvest the mystical jumjum stalk in our fields.  Karana has blessed us indeed.", e.other:GetCleanName()));  
	elseif(e.message:findi("starving")) then
		if(e.other:GetFaction(e.self) < 5) then
			e.self:Say("Deputy Eigon! I forgot! I was supposed to bring him some turnips to eat while he is on patrol! Oh... He asked so nicely, too. I feel bad that I forgot. If only someone would take these [turnips] to the Deputy..");
		else
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		end
	elseif(e.message:findi("turnips")) then
		if(e.other:GetFaction(e.self) < 5) then
			e.self:Say("Oh, thank you so much! You can keep any payment he gives you. Be sure to tell him I'm sorry.");
			e.other:SummonItem(16165);
		else
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		end
	end
end

function event_timer(e)
	if (timer == "blurt") then
		e.self:Say("Oh Dear.. I can't believe I forgot.. He must be [starving]!");
	end
end

--END of FILE Zone:rivervale  ID:19082 -- Daleen_Leafsway 

