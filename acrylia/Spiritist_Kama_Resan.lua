--Spiritist_Kama_Resan (154052)
--Khati Sha the Twisted Event

local timer = 60 -- timer for chant check cycles.  Default is 60(in seconds)
local event_failed = false;
local started = false;
local chants = 0;

function event_spawn(e)
	eq.set_timer("sit", 5*1000);
	event_failed = false;
	started = false;
end

function event_timer(e)
	if e.timer == "sit" then
		eq.stop_timer(e.timer);
		e.self:SetAppearance(1);
	elseif e.timer == "initial_chant" then
		eq.stop_timer(e.timer);
		e.self:Emote("begins to chant, when a circle of grimlings appear and silence the spell.");
		eq.set_timer("chant_check", 55 * 1000);	--first spell check is 55 seconds rather than 60
		chants = 0;
	elseif e.timer == "chant_check" then
		eq.stop_timer(e.timer);
		eq.set_timer("chant_check", timer * 1000); 
		if not CheckJammers(e) then
			e.self:Emote("chants and rocks as the spell continues.")
			eq.signal(154154,90)  --signals Ward of Life to sum up successful chants
			chants = chants + 1;
			if chants == 8 then 
				eq.stop_timer(e.timer);
			end
		else
			e.self:Emote("'s chanting is cut short by the spell jammer's magic")
		end
	elseif e.timer == "depop" then
		eq.depop();
	end
	
end

function event_say(e)
	if started and event_failed then
		e.self:Emote("stares back at you with cold and empty eyes.")
	elseif started then
		EventDialogue(e);		--calls different response based on stage in event
	elseif GuardCheck(e) and e.message:findi("hail") then 
		e.self:Say("I have an urgent matter I need your assistance with, however I cannot speak with the sanctum guardians this close.");
	elseif not GuardCheck(e) then
		if (e.message:findi("hail")) then
			e.self:Say("Thank you for coming. I am not sure what brought you here but I am glad that you have arrived. Andro and I came here as part of a raiding party. Our entire party was captured, all except Andro and I died. In the time we have been here, we have learned of 3 [" .. eq.say_link("seals") .. "] which protect the inner chambers.");
		elseif(e.message:findi("seals")) then
			e.self:Say("Interesting, from what we can tell each of the 3 seals embodies one of the principles with which the grimlings were created, Life, Death, and Spirit. Each of the seals has been enclosed in a Warder whose very existence is tied to the seal. Destroy the [" .. eq.say_link("Warder") .. "] and the seal falls with it.");
		elseif(e.message:findi("warder")) then
			e.self:Say("We have discovered that the Life Ward exists inside this chamber, while the Death Ward exists in a chamber above. The spirit ward is hidden somewhere deeper; we can sense its presence, but cannot find its exact location. We suspect that you cannot reach it with the life and death wards still whole. We fear that the [" .. eq.say_link("situation") .. "] may be complicated even further.");
		elseif(e.message:findi("situation")) then
			e.self:Say("The Wards are a by-product of the magic that was used to create the grimlings, there is symmetry between them. We have managed a [" .. eq.say_link("spell") .. "] that will destroy the magic hiding two of the Wards, the Life Ward and the Death Ward. Starting the spell will cause both to manifest, however the magic protecting the Life Ward will not fall completely until we have completed our spell.");
		elseif(e.message:findi("casting")) then
			e.self:Say("There is one more thing I should mention... While we were perfecting the spell, whenever we would get close the life ward would summon grimlings to disrupt our chants. We are not able to concentrate or focus with them present. You will have to make sure they are not around to stop our magic, and do not forget that the death and spirit wards will resurrect the life ward if one or the other isn't destroyed shortly after it falls. Let me know when you are [" .. eq.say_link("We are ready for you to begin your spell", false, "ready for us to begin our spell.") .. "]");
		elseif(e.message:findi("ready")) then 		
			eq.set_timer("initial_chant",200)  --added small delay to try to sync up emotes
			eq.signal(154053,1);  --signal Spiritist_Andro_Shimi for initial chant
			eq.signal(154130,1,0);
			started = true;
			--eq.spawn2(154156,0,0,342.75,-232.48,-7.94,374.0); -- Spawn Spiritist V2
			--eq.depop();
		elseif(e.message:findi("spell")) then
			e.self:Say("The spell will use our own life force to break the life ward's shields, we will die shortly after we begin casting, if we do not complete [" .. eq.say_link("casting") .. "] our spell. Even if we do our life force is tied to that of the Wards, we will die shortly after completion if either Life, or Death Wards still live.");
		end
	end
end

function event_signal(e)
	if e.signal == 10 then
		eq.stop_timer("chant_check");
		e.self:SetAppearance(3);
		e.self:Emote("gasps loudly as she realizes her spell has failed.  Her eyes gloss over as she stares silently into the abyss.")
		eq.set_timer("depop",60 * 1000);
		event_failed = true;
	end
end
function event_death_complete(e)
	eq.signal(154130,5,10);
end


function GuardCheck(e)
	local npc_list = eq.get_entity_list():GetNPCList();
		
	if(npc_list ~= nil) then
		for npc in npc_list.entries do
			if npc:CalculateDistance(e.self:GetX(),e.self:GetY(),e.self:GetZ()) <= 35 and npc:GetNPCTypeID() ~= 154052 and npc:GetNPCTypeID() ~= 154337 and not npc:IsPet() then
				return true;  --mob in range 
			end
		end
	else
		return false;  --returns false - no guards in range
	end
end

function CheckJammers(e)
	local npc_list = eq.get_entity_list():GetNPCList();
		
	if(npc_list ~= nil) then
		for npc in npc_list.entries do
			if npc:CalculateDistance(e.self:GetX(),e.self:GetY(),e.self:GetZ()) <= 45 and npc:GetNPCTypeID() == 154147 then
				return true;  --mob in range 
			end
		end
	else
		return false;  --returns false - no guards in range
	end
end

function EventDialogue(e)
	if chants ~= nil then
		if chants < 2 then 		
			e.self:Say("I have just begun with my portion of the chant.  Stay vigilant, our work has just begun.")
		elseif chants < 4 then 
			e.self:Say("You are doing well, I have made it through the first quarter of my incantations.")
		elseif chants <= 6 then 
			e.self:Emote("takes a deep breath.  The spell is coming, keep your wits sharp.  Some of these skeletons are the remains of our companions.")
		elseif chants < 8 then
			e.self:Say("The end draws near, I only hope I can still finish before the Wards fall back behind their veil");
		elseif chants == 8 then
			e.self:Emote("looks tired and drained.  My portion of the spell is complete, but my survival, and our success is still dependant on the completion of the spell and the death of both Wards.")
		end
	end
end
