-- Witchdoctor_Gnorgtarg for WitchDoctor Ring (Inner Acrylia)
--NPC ID: 154391

--a_grimling_summoner NPCID listing by elemental resist
local MR =	154393;
local FR = 	154394;
local CR =  154392;
local PR = 	154395;

local counter = 0;  --for emote script


function event_spawn(e)
	eq.set_timer("depop", 10*60*1000);  --10 min depop
	
	if eq.get_entity_list():IsMobSpawnedByNpcTypeID(MR) then 	--checks to see if Summoner is dead - if alive then Witchdoctor will be immune to that element
		e.self:ModifyNPCStat("MR","1000") 
		e.self:Shout("MR Immune")  --debug
		counter = counter + 1;
	end
	
	if eq.get_entity_list():IsMobSpawnedByNpcTypeID(PR) then --checks to see if Summoner is dead - if alive then Witchdoctor will be immune to that element
		e.self:ModifyNPCStat("PR","1000") 
		e.self:Shout("PR Immune")  --debug
		counter = counter + 1;
	end
	
	if eq.get_entity_list():IsMobSpawnedByNpcTypeID(CR) then --checks to see if Summoner is dead - if alive then Witchdoctor will be immune to that element
		e.self:ModifyNPCStat("CR","1000") 
		e.self:Shout("CR Immune")  --debug
		counter = counter + 1;
	end
	
	if eq.get_entity_list():IsMobSpawnedByNpcTypeID(FR) then --checks to see if Summoner is dead - if alive then Witchdoctor will be immune to that element
		e.self:ModifyNPCStat("FR","1000") 
		e.self:Shout("FR Immune")  --debug
		counter = counter + 1;
	end

	if counter == 4 then		--Dialogue checks
		e.self:Shout("Tresspassers, you are too late!  I can feel the elemental energies coursing through my body.  You do not stand a chance of defeating me!")
	elseif counter > 0 then 
		e.self:Shout("Enough of your futile interference!  The transfer of elements may only be partially completed, but I certainly have enough power to destroy the likes of you!")
	elseif counter == 0 then
		e.self:Shout("You may have defeated my summoners, but you will not defeat me!  Prepare to die in honor of the Master!")
	end
end

function event_death_complete(e)
	eq.signal(154404,1); --signal event reset
end

function event_timer(e)
	if e.timer == "depop" then
		eq.signal(154404,1);
		eq.depop();
	end
end