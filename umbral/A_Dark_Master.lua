-- A Dark Master, part of doomshade trigger

function event_spawn(e)
	eq.set_timer('chant', 60 * 1000);
end

function event_timer(e)
	if e.timer == 'chant' then
		local qglobals = eq.get_qglobals(e.self);
		if qglobals['Doomshade'] == nil and qglobals['dark_chant'] == nil then
			eq.zone_emote(1, 'An unearthly wail fills the air as the Dark Masters begin chanting for the coming of doom.');
			eq.set_global("dark_chant","chanted",3,"M20");
		end
	end
end

function event_death_complete(e)
	-- if this is the last Dark Master and Doomshade lockout is not set, spawn Doomshade and set lockout
	local qglobals = eq.get_qglobals(e.self);
	if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(176042) and qglobals['Doomshade'] == nil then
		lockout = "H" .. (59 + math.random(25));
		eq.set_global("Doomshade","lockout",3,lockout);
		eq.unique_spawn(176216, 0, 0, 127, -297, 0);
		eq.zone_emote(1, "A tortured scream echoes throughout the plains as a tormented spirit is released upon the land.");
	end
end