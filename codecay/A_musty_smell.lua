--A_musty_smell (200216) in Crypt of Decay (FLAVOR)

function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 30, xloc + 30, yloc - 30, yloc + 30);
end

function event_enter(e)
    e.self:Emote("surrounds you as you enter the depths of a darkened crypt.");
    eq.depop_with_timer();
end



