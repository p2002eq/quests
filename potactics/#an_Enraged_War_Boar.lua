--#an_Enraged_War_Boar (214311)
--potactics

function event_spawn(e)
	eq.set_timer("grow", 30 * 1000);
	local glykus = eq.get_entity_list():GetMobByNpcTypeID(214053);	--Glykus_Helmir (214053)
	eq.move_to(glykus:GetX(),glykus:GetY(),glykus:GetZ(), glykus:GetHeading(),true);
	e.self:AddToHateList(glykus:GetHateTop(),1);
end

function event_timer(e)
	if e.timer == "grow" and not e.self:Charmed() and not e.self:IsMezzed() then
		eq.stop_timer(e.timer)
		eq.spawn2(214312,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());	--#a_Fierce_War_Boar (214312)
		eq.depop();
	end
end