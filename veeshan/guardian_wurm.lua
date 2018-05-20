--guardian_wurm (108506)
--script to randomize guardian_wurm abilities and melee stats
--veeshan

function event_spawn(e)
	--determine min/max hit values (50% chance to use default values 99/300 min/max hit)
	local rand = math.random(100);
	if rand <= 5 then
		e.self:ModifyNPCStat("min_hit", "325");
		e.self:ModifyNPCStat("max_hit", "1550");
	elseif rand <= 50 then
		e.self:ModifyNPCStat("min_hit", "155");
		e.self:ModifyNPCStat("max_hit", "755");
	end
	
	local rand = math.random(100);	--check roll to determine spellset (wurms can either do nothing, cast dragon roar, wurm breath, frost breath, or wurm blaze)
	if rand <= 40 then
		local spell_table = {862,789,832,786};
		local recast = {-1,-1,-1,18};
		local spell = math.random(4);
		e.self:AddAISpell(0,spell_table[spell],1,0,recast[spell],-1);
	end
end


function event_death_complete(e)	--check for wurm splits
	local x,y,z,h = e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading();
	local roll = math.random(100);
	if roll <= 5 then 	--5% chance to spawn 2 wurms
		eq.spawn2(108506,0,0,x + 7,y,z,h);
		eq.spawn2(108506,0,0,x - 7,y,z,h);
	elseif roll <= 20 then  -- 20% chance atleast 1 wurm will respawn
		eq.spawn2(108506,0,0,x,y,z,h);
	end
end
