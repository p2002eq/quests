--#Falto_trigger (210484)
--Trigger for Falto, Lord_of_Thunder (210468)
--postorms


function event_spawn(e)
	eq.depop(210468);	--depop Falto, Lord_of_Thunder if up
	SetupEvent();
end

function event_signal(e)
	if e.signal == 0 then
		if not trash_check() then
			eq.unique_spawn(210468,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --Falto, Lord_of_Thunder (210468)
			eq.depop_with_timer();
		end
	elseif e.signal == 99 then	--signal to reset event on failure/idle timer
		SetupEvent();
	end
end

function trash_check()	--iterate through related NPC ids to verify tree mobs are clear
	local mob_table = {210458,210459};	--a_blazing_mephit (210458), a_burning_mephit (210459)

	for _,mobs in pairs(mob_table) do
		if eq.get_entity_list():IsMobSpawnedByNpcTypeID(mobs) then
			return true;
		end
	end			
	return false;
end

function SetupEvent()
	eq.depop_all(210458); 	--a_blazing_mephit (210458)
	eq.depop_all(210459); 	--a_burning_mephit (210459)
	eq.depop_all(210460); 	--a_fiery_mepheeka (210460)
	eq.depop_all(210483); 	--#a_vivacious_ent (210483)
	eq.depop_all(210482);	--#a_decrepit_ent (210482)
	eq.spawn2(210482,0,0,-970,6086,-480,170);	--repop #a_decrepit_ent (210482)
	spawn_mephits();  --stage roaming mobs
end

function spawn_mephits()	--a_blazing_mephit (210458), or a_burning_mephit (210459)
	eq.spawn2(eq.ChooseRandom(210458,210459),0,0,-611,5277,-490,244);
	eq.spawn2(eq.ChooseRandom(210458,210459),0,0,-973,5661,-546,85);
	eq.spawn2(eq.ChooseRandom(210458,210459),0,0,-552,5620,-509,187);
	eq.spawn2(eq.ChooseRandom(210458,210459),0,0,-446,5368,-462,251);
	eq.spawn2(eq.ChooseRandom(210458,210459),0,0,-715,5888,-564,161);
	eq.spawn2(eq.ChooseRandom(210458,210459),0,0,-320,5988,-514,142);
	eq.spawn2(eq.ChooseRandom(210458,210459),0,0,-231,5313,-518,20);
	eq.spawn2(eq.ChooseRandom(210458,210459),0,0,-1003,5528,-538,116);
	eq.spawn2(eq.ChooseRandom(210458,210459),0,0,-462,6011,-507,148);
	eq.spawn2(eq.ChooseRandom(210458,210459),0,0,-377,5713,-559,227);
	eq.spawn2(eq.ChooseRandom(210458,210459),0,0,-92,5371,-495,229);
	eq.spawn2(eq.ChooseRandom(210458,210459),0,0,-361,5320,-462,26);
	eq.spawn2(eq.ChooseRandom(210458,210459),0,0,-864,5111,-539,30);
	eq.spawn2(eq.ChooseRandom(210458,210459),0,0,-886,5892,-527,176);
	eq.spawn2(eq.ChooseRandom(210458,210459),0,0,-571,5976,-532,142);
	eq.spawn2(eq.ChooseRandom(210458,210459),0,0,-140,5720,-523,155);
	eq.spawn2(eq.ChooseRandom(210458,210459),0,0,-375,5474,-468,55);
	eq.spawn2(eq.ChooseRandom(210458,210459),0,0,-496,5551,-490,93);
	eq.spawn2(eq.ChooseRandom(210458,210459),0,0,-650,5601,-486,32);
	eq.spawn2(eq.ChooseRandom(210458,210459),0,0,-693,5448,-472,16);
	eq.spawn2(eq.ChooseRandom(210458,210459),0,0,-792,5415,-480,111);
	eq.spawn2(eq.ChooseRandom(210458,210459),0,0,-1086,5380,-494,40);
	eq.spawn2(eq.ChooseRandom(210458,210459),0,0,-1004,5027,-540,2);
	eq.spawn2(eq.ChooseRandom(210458,210459),0,0,-637,5107,-514,193);
	eq.spawn2(eq.ChooseRandom(210458,210459),0,0,-425,4993,-537,226);
	eq.spawn2(eq.ChooseRandom(210458,210459),0,0,-179,5089,-525,155);
	eq.spawn2(eq.ChooseRandom(210458,210459),0,0,-136,5541,-524,126);
	eq.spawn2(eq.ChooseRandom(210458,210459),0,0,-135,5867,-503,147);
	eq.spawn2(eq.ChooseRandom(210458,210459),0,0,-351,5911,-540,46);
	eq.spawn2(eq.ChooseRandom(210458,210459),0,0,-730,5730,-575,53);
	eq.spawn2(eq.ChooseRandom(210458,210459),0,0,-1058,5742,-533,122);
	eq.spawn2(eq.ChooseRandom(210458,210459),0,0,-1037,5995,-491,87);
end
