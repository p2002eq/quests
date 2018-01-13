--EarthTrapSpawner (209094)
--zone: bothunder
--No evidence on live that these traps did anything more than an emote.  Did not see any resulting hail storm cast or any other spell cast/emote in any wings besides Water wing/tower

function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 30, xloc + 30, yloc - 30, yloc + 30);
end

function event_enter(e)
	if e.other:CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ()) <= 50 then	--calc distance for Z-axis check
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 7, 70, "Storm clouds begin to gather over your head.");
		eq.set_timer("delay",4*1000);	--commented out timer since no proof these traps resulted in spell cast or future emotes as noted above
	end
end

--[[
function event_timer(e)
	if e.timer == "delay" then
		local rand = math.random(1,100);
		if rand <= 40 then
			eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 7, 70,"The storm clouds pass harmlessly.");
		else
			e.self:SpellFinished(1032,e.self);	--Hail Storm
		end
		eq.depop_with_timer();
	end
end]]




