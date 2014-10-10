-- Attempt to limit players level 53 and over from engaging nagafen and vox.
-- Banished to Lavastorm.
local SpawnX;
local SpawnY;
local SpawnZ;
local SpawnH;

function event_spawn(e)
	SpawnX = e.self:GetX();
	SpawnY = e.self:GetY();
	SpawnZ = e.self:GetZ();
	SpawnH = e.self:GetHeading();
	local range = 200;
	eq.set_proximity(SpawnX - range, SpawnX + range, SpawnY - range, SpawnY + range);
	eq.set_next_hp_event(96);
						eq.zone_emote(0,tostring(SpawnX));
end

function event_hp(e)
	--if my HP are dropping make certain the timer is running
	--this gets around 100% pet tanking, because the owner is
	--on the aggro list but with 0's and EVENT_AGGRO isn't firing.
						eq.zone_emote(0,"enter HP event check (debug)");
	eq.stop_timer("1");
	--event_combat();
	--backup safety check
	--eq.set_next_hp_event(hp_event - 9); --tossing errors
end

function event_enter(e)
	if((e.self:GetLevel() > 52)) then --and (e.other:Admin() < 80)) then --uncomment when working, is off for debugging
		--e.self:MessageClose(e.self,FALSE,200,0, "I will not fight you, but I will banish you!");
		-- nameless emotes don't work yet
		eq.zone_emote(0,"I will not fight you, but I will banish you! (event_enter)");
		--e.self:MovePC(27,-64,262,-93.96,0); --uncomment when working, is off for debugging
	end
end

function event_combat(e)
	if(e.joined == true) then
						eq.zone_emote(0,"enter COMBAT event check (debug)");
		eq.set_timer("1",1000); --a 1 second leash timer.
	end
end

function event_timer(e)
	if(e.timer == "1") then
						eq.zone_emote(0,"enter TIMER event check (debug)"); -- This pile of crap stalls out now..........................
		if(SpawnX < -1000 or SpawnX > -650 or SpawnY < -1500 or SpawnY > -1290) then
			WIPE_AGGRO();
		end
		local my_hate_list = e.self:GetHateList();
		if(my_hate_list) then
			e.self:ForeachHateList(
			function(ent, hate, damage, frenzy)
				e.self:Say("passed HATE list check (debug) ");
				if(ent:IsClient() and ent:GetLevel() > 52) then
					e.self:Say(ent:GetName());
				end
			end
			);

		--	for ent in my_hate_list.entries do
		--		local h_ent = eq.get_entity_list()
		--				eq.zone_emote(0,"passed HATE list check (debug)");
		--		if(e.other:IsClient() == true) then --tossing errors
		--			if(e.other:GetLevel() > 52) then --and (e.other:Admin() < 80)) then --uncomment when working, is off for debugging
		--				eq.zone_emote(0,"I will not fight you, but I will banish you! (event_timer)");
		--				--h_ent:CastToClient():MovePC(27,-64,262,-93.96,0); --old player banish line, left in and commented incase it might be needed?
		--				--e.other:MovePC(27,-64,262,-93.96,0); --uncomment when working, is off for debugging
		--			end
		--		end
			eq.set_timer("1",1000); --a 1 second leash timer.
		else
			WIPE_AGGRO();
		end
	end
end

function WIPE_AGGRO(e)
						eq.zone_emote(0,"enter WIPE AGRO event check (debug)");
	e.self:BuffFadeAll();
	e.self:WipeHateList();
	e.self:SetHP(e.self:GetMaxHP());
	e.self:GMMove(SpawnX,SpawnY,SpawnZ,SpawnH);
	eq.stop_timer("1");
	eq.set_next_hp_event(96);
end

-- EOF zone: soldungb ID: 32040 NPC: Lord_Nagafen
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
