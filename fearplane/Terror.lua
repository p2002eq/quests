--Spawns an iksar broodling on the death of the golems 75% of the time.

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
	eq.move_to(-364,199,125.199,132,true);
	eq.stop_timer("goback");
end

function event_death_complete(e)
	local a = eq.ChooseRandom(72105,72105,72105,0);
	-- local x = e.self:GetX();
	-- local y = e.self:GetY();
	-- local z = e.self:GetZ();
	-- local h = e.self:GetHeading();
	eq.spawn2(a,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
end

--Submitted by: Jim Mills (Gilmore Girls`Is`Awesome`XOXO)
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
