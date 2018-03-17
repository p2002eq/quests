--Spiritist_Andro_Shimi (154053)
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

function event_say(e)
	if e.message:findi("hail") then
		if event_failed then
			e.self:Emote("stares back at you with cold and empty eyes.")
		elseif started then
			EventDialogue(e);	--calls different response based on stage in event
		elseif GuardCheck(e) then 
			e.self:Say("I have an urgent matter I need your assistance with, however I cannot speak with the sanctum guardians this close.");
		else
			e.self:Say("Greetings, please speak with Kama.  She will explain what we need of you.  Hurry before the guards return.")
		end
	end
end



function event_signal(e)
	if e.signal == 1 then
		e.self:Emote("begins to chant, when a circle of grimlings appear and silence the spell.");
		eq.set_timer("chant_check", 55 * 1000);		--first spell check is 55 seconds rather than 60
		started = true;
		chants = 0;
	elseif e.signal == 10 then
		eq.stop_timer("chant_check");
		event_failed = true;
		e.self:SetAppearance(3);
		e.self:Emote("falls over onto his side.  His breath slows as the last of his life drains from his body.")
		eq.set_timer("depop",60 * 1000);
	end
end

function event_timer(e)
	if e.timer == "sit" then
		eq.stop_timer(e.timer);
		e.self:SetAppearance(1);
	elseif e.timer == "chant_check" then
		eq.stop_timer(e.timer);
		eq.set_timer("chant_check", timer * 1000);
		if not CheckJammers(e) then
			e.self:Emote("chants and rocks as the spell continues.")
			eq.signal(154154,95)  --signals Ward of Life to sum up successful chants
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


function event_death_complete(e)
	eq.signal(154130,5,10); --signals WDTrapMN (event has failed)
end

function GuardCheck(e)
	local npc_list = eq.get_entity_list():GetNPCList();
		
	if(npc_list ~= nil) then
		for npc in npc_list.entries do
			if npc:CalculateDistance(e.self:GetX(),e.self:GetY(),e.self:GetZ()) <= 35 and npc:GetNPCTypeID() ~= 154053  and not npc:IsPet() then
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