-- Event controller (162266) in Ssra

function event_spawn(e)
	reset();
end

function event_signal(e)
	-- bitwise signal values for the 10 kills
	if e.signal < 10000 then
		local qglobals = eq.get_qglobals(e.self);
		if qglobals['cursed'] == nil then
			signal_total = e.signal;
			eq.set_global('cursed', 'started', 2, 'H1');
		else
			signal_total = signal_total + e.signal;
		end
		
		if signal_total == 1023 then
			if qglobals['cursed_progress'] == nil then
				eq.set_timer('glyphed', math.random(300) * 1000)
			elseif tonumber(qglobals['cursed_progress']) < 3 then
				eq.set_timer('runed', math.random(300) * 1000)
			else
				reset();
			end
		end
	end		
end

function reset()
	signal_total = 0;
	eq.delete_global('cursed');
end

function event_timer(e)
	eq.stop_timer(e.timer)
	if e.timer == 'glyphed' then
		eq.unique_spawn(162505, 0, 0, -38, -10, -222); -- spawn glyphed
		reset();
	elseif e.timer == 'runed' then
		eq.unique_spawn(162508, 0, 0, -38, -10, -222); -- spawn runed
		reset();
	end
end

function event_say(e)
	if e.other:Admin() > 100 then
		if(e.message:findi("hail")) then
			e.other:Message(1, string.format('Hello %s, would you like [help] with the Cursed cycle?', e.other:GetName()))
		elseif(e.message:findi("help")) then
			e.other:Message(1, "You can check the [status] of the cycle, set cycle to [Cursed] available only, set cycle to [Exiled] + Cursed available, set cycle to [Glyphed] + Exiled + Cursed available, set cycle to all [disabled], or [respawn] trigger mobs (also restarts trigger timer).")
		elseif(e.message:findi("status")) then
			local qglobals = eq.get_qglobals(e.self);
			local timer = (qglobals['cursed'] == nil and 'stopped' or 'running')
			local glyphed, exiled, cursed
			if qglobals['cursed_progress'] == nil then
				glyphed,exiled,cursed = "UP","UP","UP"
			elseif tonumber(qglobals['cursed_progress']) == 1 then
				glyphed,exiled,cursed = "DOWN","UP","UP"
			elseif tonumber(qglobals['cursed_progress']) == 2 then
				glyphed,exiled,cursed = "DOWN","DOWN","UP"
			elseif tonumber(qglobals['cursed_progress']) == 3 then
				glyphed,exiled,cursed = "DOWN","DOWN","DOWN"
			else
				glyphed,exiled,cursed = "UNKNOWN","UNKNOWN","UNKNOWN"
			end
			e.other:Message(1, string.format('Trigger mob timer is %s. Glyphed is %s. Exiled is %s. Cursed is %s.', timer, glyphed, exiled, cursed))
		elseif(e.message:findi("Cursed")) then
			eq.set_global('cursed_progress', '2', 3, 'D8')
			e.other:Message(1, "Cursed spawn reset.")
			eq.debug(string.format('Cursed event - %s reset Cursed.', e.self:GetName()))
		elseif(e.message:findi("Exiled")) then
			eq.set_global('cursed_progress', '1', 3, 'D8')
			e.other:Message(1, "Exiled spawn reset.")
			eq.debug(string.format('Cursed event - %s reset Exiled.', e.self:GetName()))
		elseif(e.message:findi("Glyphed")) then
			eq.delete_global('cursed_progress')
			e.other:Message(1, "Full cycle reset.")
			eq.debug(string.format('Cursed event - %s reset Glyphed.', e.self:GetName()))
		elseif(e.message:findi("disabled")) then
			eq.set_global('cursed_progress', '3', 3, 'D8')
			e.other:Message(1, "Full cycle disabled.")
			eq.debug(string.format('Cursed event - %s disabled cycle.', e.self:GetName()))
		elseif(e.message:findi("respawn")) then
			reset()
			local trigger_spawns = { 352960, 368763, 352956, 353147, 353037, 353035, 352958, 352957, 352955, 352952 }
			for _,spawnid in pairs(trigger_spawns) do
				local spawn = eq.get_entity_list():GetSpawnByID(spawnid);
				spawn:ForceDespawn();
				spawn:Enable();
				spawn:Repop();
			end
			e.other:Message(1, "Cycle triggers respawned and reset.")
			eq.debug(string.format('Cursed event - %s reset trigger mobs.', e.self:GetName()))
		end
	end
end
