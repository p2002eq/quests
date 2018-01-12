--a_minion_of_Maareq (207293)
--Plane of Torment (Saryrn's Tower)

function event_timer(e)
	if e.timer == "path" then
		maareq = eq.get_entity_list():GetMobByNpcTypeID(207004);	--Maareq_the_Prophet (207004)
		e.self:CastToNPC():MoveTo(maareq:GetX(), maareq:GetY(), maareq:GetZ(),maareq:GetHeading(),true);
	end
end

function event_waypoint_arrive(e)
	if e.wp == 3 then
		eq.set_timer("path",1);
	end
end

