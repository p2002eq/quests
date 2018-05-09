--#an_Enchanted_War_Boar (214314)
--potactics

function event_spawn(e)
	local glykus = eq.get_entity_list():GetMobByNpcTypeID(214053);	--Glykus_Helmir (214053)
	eq.move_to(glykus:GetX(),glykus:GetY(),glykus:GetZ(), glykus:GetHeading(),true);
	e.self:AddToHateList(glykus:GetHateTop(),1);
	eq.set_timer("depop", 5 * 60 * 1000);
end

function event_timer(e)
	if e.timer == "depop" and not e.self:IsEngaged() then
		eq.depop();
	end
end