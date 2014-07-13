-- Attempt to limit players level 53 and over from engaging nagafen and vox.
-- Player will be banished to just outside the permafrost zone in everfrost.
local SpawnX = 0;
local SpawnY = 0;
local SpawnZ = 0;
local SpawnH = 0;

function event_spawn(e)
	SpawnX = e.self:GetX();
	SpawnY = e.self:GetY();
	SpawnZ = e.self:GetZ();
	SpawnH = e.self:GetHeading();
	local range = 200;
	local range2 = 88;
	eq.set_proximity(x - range, x + range, y - range2, y + range);
	eq.set_next_hp_event(96);
end

function event_hp(e)
	--if my HP are dropping make certain the timer is running
	--this gets around 100% pet tanking, because the owner is
	--on the aggro list but with 0's and EVENT_AGGRO isn't firing.
	eq.stop_timer(1);
	EVENT_AGGRO();
	--backup safety check
	eq.set_next_hp_event(int(e.self:GetHPRatio())-9);
end

function event_enter(e)
	if((e.other:GetLevel() >= 53) and (e.other:Admin() < 80)) then
		e.self:MessageClose(e.self,FALSE,200,0, "I will not fight you, but I will banish you!");
		e.self:MovePC(30,-7024,2020,-60.7,0);
	end
end

function event_combat(e)
	if(e.joined == true) then
		-- a 1 second leash timer.
		eq.set_timer(1,1000);
	end
end

function event_timer(e)
	if(timer == 1) then
		if(x < -431 or x > -85 or y < 770 or y > 1090 or z < -50) then
			WIPE_AGGRO();
		end
		my @hate_list = e.self:GetHateList();
		local hate_count = @hate_list;
		if(hate_count > 0) then
			foreach ent (@hate_list)
			local h_ent = ent:GetEnt();
			local h_dmg = ent:GetDamage();
			local h_hate = ent:GetHate();
			if(h_ent:IsClient()) then
				if(h_ent:GetLevel() > 52) then
					eq.zone_emote(0,"I will not fight you, but I will banish you!");
					h_ent:CastToClient():MovePC(30,-7024,2020,-60.7,0);
				end
			end
		
		else
			WIPE_AGGRO();
		end
	end
end

sub WIPE_AGGRO
e.self:BuffFadeAll();
e.self:WipeHateList();
e.self:SetHP(e.self:GetMaxHP());
e.self:GMMove(SpawnX,SpawnY,SpawnZ,SpawnH);
eq.stop_timer(1);
eq.set_next_hp_event(96);
end

-- EOF zone: permafrost ID: 73057 NPC: Lady_Vox

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
