--A_firestorm_portal (209122)
--Evynd_Firestorm Event
--zone: bothunder

function event_signal(e)
	if e.signal == 1 then
		e.self:Emote("begins to glow as a several fiery figures form inside.");
		boss = eq.get_entity_list():GetMobByNpcTypeID(209054);	--Evynd_Firestorm
		storm = eq.spawn2(209005,0,0,e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());	--A_firestorm_elemental (209005)
		storm:CastToNPC():MoveTo(boss:GetX() + math.random(-20,20), boss:GetY() + math.random(-20,20), boss:GetZ(),boss:GetHeading(),true);
		eq.set_timer("depop", 5 * 60 * 1000, storm);
	end
end
