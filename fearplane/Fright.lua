--Spawns an iksar broodling on the death of the golems 75% of the time.

--DT script variables
local dt_spellid = 982	-- (982: Cazic touch, 2859: Touch of Vinitras)
local dt_recast = 45; -- (in seconds)

function event_spawn(e)
	timer_on = false;	--DT script
end

function event_signal(e)
	entity_list = eq.get_entity_list();

	if(e.signal == 1) then
		e.self:Say("Such is the will of Cazic-Thule!");
	elseif(e.signal == 2) then
		eq.stop_timer("goback");
		local mobtypeID =  entity_list:GetMobByNpcTypeID(72003);
		e.self:GMMove(mobtypeID:GetX(),mobtypeID:GetY(),mobtypeID:GetZ());
	elseif(e.signal == 3) then
		eq.set_timer("goback",math.random(20000));
	end
end

function event_timer(e)
	if e.timer == "goback" then
		eq.move_to(-357,-635,135.199,196,true);
		eq.stop_timer("goback");
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
		if not timer_on then
			eq.set_timer("DT",math.random(0,2000));	--set initial cast timer
			timer_on = true;
		end
	end
end

function event_cast_begin(e)
	if e.spell:ID() == dt_spellid then
		e.self:Shout(string.format("%s!", string.upper(target:GetName())));
	end
end		


function event_death_complete(e)
	local a = eq.ChooseRandom(72105,72105,72105,0);
	-- local x = e.self:GetX();
	-- local y = e.self:GetY();
	-- local z = e.self:GetZ();
	-- local h = e.self:GetHeading();
	eq.spawn2(a,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
end

