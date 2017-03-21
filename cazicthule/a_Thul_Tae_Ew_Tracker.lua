-- a_Thul_Tae_Ew_Tracker (48377) for Gnome Escort in CT

function event_spawn(e)
	e.self:Say("So, there you are, little Gnome. Thought you evaded us? Your friends will never protect you. You will all fall before our power!")
	eq.set_timer('depop', 10 * 60 * 1000)
end

function event_timer(e)
	if e.timer == 'depop' then
		eq.depop()
	end
end
