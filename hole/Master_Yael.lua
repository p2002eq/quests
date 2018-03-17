--Master Yael
--script to control DT cycle

--DT script variables
local dt_spellid = 982	-- (982: Cazic touch, 2859: Touch of Vinitras)
local dt_recast = 30;

function event_spawn(e)
	timer_on = false;	--DT script
end

function event_timer(e)
	if e.timer == "DT" then		--DT SCRIPT ROUTINE STARTS HERE
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
		if not timer_on then
			eq.set_timer("DT",math.random(0,2000));	--set initial cast timer
			timer_on = true;
		end
	end
end

function event_cast_begin(e)
	if e.spell:ID() == dt_spellid then		--Cazic Touch
		e.self:Shout(string.format("%s!", string.upper(target:GetName())));
	end
end			--END DT ROUTINE



