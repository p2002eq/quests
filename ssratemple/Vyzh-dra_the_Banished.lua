-- Vyzh`dra the Banished (162510) for Cursed cycle in Ssratemple
-- the script counts up increments of 10 seconds that are spent out of combat to reach the 25-min 'unengaged' time limit

local dt_spellid = 2859	-- (982: Cazic touch, 2859: Touch of Vinitras)
local dt_recast = 120;

function event_spawn(e)
	total_time = 0
	eq.set_timer('incr', 10 * 1000)
	timer_on = false;
end

function event_timer(e)
	if e.timer == 'incr' and not e.self:IsEngaged() then
		total_time = total_time + 1
		if total_time >= 150 then
			eq.stop_timer(e.timer)
			eq.depop()
		end	
	elseif e.timer == "DT" then		--DT SCRIPT ROUTINE STARTS HERE
		if e.self:IsEngaged() then 
			target = e.self:GetHateTop();			
			if target:DivineAura() then		--DA check routine			
				local DA_spell_table = {	130,	--Harmshield
											199, 	--Divine Barrier
											207,	--Divine Aura	
											1612,	--Quivering Veil of Xarn
											1749,	--Kazumi's Note of Preservation
											2741 };	--Sacred Barrier
				
				for n = 1,table.getn(DA_spell_table) do	--iterate through DA spell table to remove any DA buffs on target
					if target:FindBuff(DA_spell_table[n]) then target:BuffFadeBySpellID(DA_spell_table[n]) end
				end
			end	
			
 			if target:IsPet() then		--Pet check routine
				target = target:GetOwner();		--If pet is at top of hate list then target will change to owner
			end
			
			e.self:CastSpell(dt_spellid,target:GetID());	--Casts DT (LoS check determined by spell type)
			eq.stop_timer(e.timer);
			eq.set_timer("DT",dt_recast*1000);	--restart DT timer for correct recast
		else
			timer_on = false;	--timer turns off if recast is ready and Mob is not engaged
			eq.stop_timer("DT");			
		end	
	end
end

function event_combat(e)
	if e.joined then
		e.self:Shout('Bow before your only god! I will tear all others from the heavens!')		
		if not timer_on then
			eq.set_timer("DT",math.random(0,2000));	--set initial cast timer
			timer_on = true;
		end
	end
end

function event_cast_begin(e)
	if e.spell:ID() == 2859 then		--Touch of Vinitras
		e.self:Shout(string.format("%s!", string.upper(target:GetName())));
	end
end			--END DT ROUTINE

function event_slay(e)
	if e.other:IsClient() then
		e.self:Say('Remove that waste of flesh from my sight!')
	end
end



function event_death_complete(e)
	eq.stop_all_timers()
	e.self:Emote("'s corpse falls to the ground as new energy fills the room!")
	local qglobals = eq.get_qglobals(e.self);
	if tonumber(qglobals['cursed_progress']) == 2 then
		eq.unique_spawn(162507, 0, 0 , -38, -10, -222) -- spawn Vyzh`dra the Cursed
	else
	end
end
