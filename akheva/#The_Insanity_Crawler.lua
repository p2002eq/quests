-- The Insanity Crawler (179350) in Akheva

function event_spawn(e)
	eq.zone_emote(1, "You hear squealing voices of Centi echo through the dark hallways. Something must have them frightened. You find yourself wondering what could possibly scare the servants of the Akheva. Do you really want to know?")
	eq.set_timer('depop', 30 * 60 * 1000)
end

function event_slay(e)
	if e.other:IsClient() or e.other:IsPet() then -- not sure why this is necessary, but otherwise will occasionally spawn adds when an event mob dies
		eq.spawn2(179346,0,0,e.other:GetX() - 10,e.other:GetY(),e.other:GetZ(),e.other:GetHeading());
		eq.spawn2(179346,0,0,e.other:GetX() + 10,e.other:GetY(),e.other:GetZ(),e.other:GetHeading());
		eq.spawn2(179346,0,0,e.other:GetX(),e.other:GetY() - 10,e.other:GetZ(),e.other:GetHeading());
		eq.spawn2(179346,0,0,e.other:GetX(),e.other:GetY() + 10,e.other:GetZ(),e.other:GetHeading());
		eq.spawn2(179346,0,0,e.other:GetX(),e.other:GetY(),e.other:GetZ(),e.other:GetHeading());
	end
end

function event_timer(e)
	if e.timer == 'depop' then
		eq.stop_timer(e.timer);
		eq.depop();
	end
end
