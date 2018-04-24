--Alter Plane: Sky (674)
--script for dispell upon entering Plane of Sky

function event_spell_effect(e)
	if eq.get_zone_id() ~= 71	then	--dispell should only occur when entering zone.  No support that dispell should occur from teleport within zone
		e.target:BuffFadeAll();
	end
end
