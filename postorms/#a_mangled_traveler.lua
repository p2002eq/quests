--#a_mangled_traveler (210474)
--encounter adds for #Jeplak,_Lord_of_Srerendi (210471)
--postorms

function event_combat(e)	--will alaready be aggro on engage
	if e.joined then
		eq.set_timer("depop", 30 * 1000);
	end
end

function event_timer(e)
	if e.timer == "depop" and not e.self:IsEngaged() then
		eq.depop();
	end
end

function event_slay(e)
	if e.other:IsClient() or e.other:IsPet() then
		for n = 1,2 do
			mob = eq.spawn2(eq.ChooseRandom(210474,210473),0,0,e.self:GetX() + math.random(-50,50),e.self:GetY() + math.random(-50,50),e.self:GetZ() - 10,e.self:GetHeading());	--#a_lost_soul or #a_mangled_traveller
			mob:AddToHateList(e.self:GetHateRandom(),1);
		end
	end
end
