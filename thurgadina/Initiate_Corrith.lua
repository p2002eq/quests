function event_spawn(e)
	eq.set_timer("3", 30000); --Make them attack every 30 seconds

end

function event_timer(e)
	e.self:DoAnim(2);
end
