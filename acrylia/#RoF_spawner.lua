-- #RoF_spawner (154372) for Ring of Fire in Acrylia

function event_spawn(e)
	eq.set_proximity(-124, -110, 74, 90)
end

function enter(e)
	eq.clear_proximity()
end
