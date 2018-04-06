--#Gakamenial_Fir`Disralsi
--poair


function event_combat(e)
	if e.joined then
		eq.set_timer("memblur",12 * 1000);
	end
end

function event_timer(e)
	if e.timer == "memblur"  then
		if eq.PlayerCheck(e.self:GetX(), e.self:GetY(), e.self:GetZ(),50) then	--check mob is engaged and player is within 50 units
			if math.random(100) <= 40 then e.self:WipeHateList() end  	--40% memblur chance
		elseif not e.self:IsEngaged() then
			eq.stop_timer(e.timer);
		end
	end
end

