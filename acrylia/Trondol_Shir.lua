--Trondol_Shir (part of High Priest ring event in AC)

--NPCS
local guard = 154354	--#a_possessed_corpse (154354)
local soulstealer = 154106	--#a_grimling_soulstealer(154106)


--event flags
local started = false
local soul = false

function event_spawn(e)
	eq.set_timer("floor", 5*1000);
	started = false
	escort_complete = false;
	soul = false;
end

function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	local instance_id = eq.get_zone_instance_id();
	
	if e.message:findi("hail") then
		if not started then
			e.self:Emote("looks around frantically, 'What are you doing here? You'll be killed! Do not waste your time trying to [" .. eq.say_link("I will help you", false, "help") .. "] me. Save yourself and leave at once!");
			e.self:SetAppearance(3);
		elseif escort_complete and qglobals[instance_id .. "_AC_Escort"] == "1" then
			e.self:Say(string.format("Thank you, %s.  I honestly did not see a future outside of that jail cell.  Please take these shackles as a symbol of my eternal gratitude.",e.other:GetName()));
			e.other:QuestReward(e.self,0,0,0,0,6513,3000);	--shackles of a vah shir captive
			eq.depop_with_timer();
		end
	elseif e.message:findi("help") then
		e.self:Emote("shakes his head in frustration, 'I am beyond help. The [" .. eq.say_link("what key?", false, "key") .. "] to my shackles is held by the grunts' [" .. eq.say_link("what high priest?", false, "high priest") .. "], curse him. I feel his dark magic pulling at my soul. I am doomed to join the legion of our fallen people that serve their twisted master here. ");
	elseif e.message:findi("key") then
		e.self:Emote("opens his mouth as if to speak, but lacks the strength to form words.");
	elseif e.message:findi("high priest") then
		e.self:Emote("speaks slowly between shallow, labored breaths, 'Through some kind of dark magic, the grunts steal away the spirit energy from their victims. I know not what they do with this energy once they procure it. When the victim is all but drained of life, the high priest forces them to walk to the end of the platform over there. He then performs some sacrificial ritual that hurls the prisoner into the pit. Shortly thereafter, the bones of the fallen are collected and reanimated, destined to serve the grunts forever. I have seen this a dozen times now, and now my time is near.'");
	end
end

function event_trade(e)
    local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.self, e.other);
	local instance_id = eq.get_zone_instance_id();
	
    if(not started and item_lib.check_turn_in(e.self, e.trade, {item1 = 6554})) then -- Grimling Shackle Key
        e.self:Say("Be on your guard friends!  Here they come!");
		started = true;
		eq.spawn2(guard,0,0,-211,-716,1,129); --#a_possessed_corpse (154354)
        eq.spawn2(guard,0,0,-205,-716,1,129); 
		eq.spawn2(guard,0,0,-196,-716,1,129);
		eq.spawn2(soulstealer,0,0,-205,-699,1,129); --#a_grimling_soulstealer(154106)
		eq.set_timer("clear",3 * 1000);
		eq.set_timer("depop",5 * 60 * 1000);  --5 min to clear room
	elseif(started and item_lib.check_turn_in(e.self, e.trade, {item1 = 6711})) then	--Grimling Soulgem
		e.self:Emote(string.format("'s eyes brighten as he appears rejuvenated. 'Thank you %s. We must make our escape quickly and then we will speak.'",e.other:GetName())); 
		eq.stop_timer("depop");
		eq.set_global(instance_id .. "_AC_Escort","1",3,"M30"); 	--sets global to recieve shackle in event of successful escort
		soul = true;		
		eq.resume();
	end
	
    item_lib.return_items(e.self, e.other, e.trade)
end

function event_waypoint_arrive(e)
	if e.wp == 2 then
		if not soul then
			e.self:Say("I cannot take another step, my spirit is fading... Save yourselves. You will have my eternal gratitude for your noble efforts.");
			e.self:SetAppearance(3);
			eq.pause(3000);	--arbitrary timer - depop will occur before pause duration ends
			eq.stop_timer("depop");		--clear old timer
			eq.set_timer("depop", 30 * 1000);	--30 seconds to hand in gem or will depop
		end
	elseif e.wp == 16 then
		escort_complete = true;
		e.self:Say("I cannot believe we escaped!  Please speak with me when you are ready.")
	end
end

function event_timer(e)
	if e.timer == "depop" then
		eq.stop_timer(e.timer);
		e.self:Emote("lets out one last gasp of breath before remaining motionless on the floor");
		eq.depop_with_timer();
	elseif e.timer == "clear" then
		if not MobCheck() then
			eq.stop_timer(e.timer);
			eq.start(20);
			e.self:Emote("slowly staggers upon his feet, 'I'm not sure how far my legs will carry me in this weakened state'")
		end
	elseif e.timer == "floor" then
		eq.stop_timer(e.timer);
		e.self:SetAppearance(3);
	end
end

function MobCheck()
	local npc_list = eq.get_entity_list():GetNPCList();

	if(npc_list ~= nil) then
		for npc in npc_list.entries do								 
			if npc:CalculateDistance(-211,-716,1) <= 75 and (npc:GetNPCTypeID() == soulstealer or npc:GetNPCTypeID() == guard) then
				return true	--mobs still in camp
			end
		end
	end
	return false;
end
