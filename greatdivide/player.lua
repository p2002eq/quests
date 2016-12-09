function event_say(e)
	elseif e.self:Admin() > 100 then
		if(e.message:findi("stage1")) then
			eq.signal(118351, 1000);
		elseif(e.message:findi("stage2")) then
			eq.signal(118351, 2000);
		elseif(e.message:findi("stage3")) then
			eq.signal(118351, 3000);
		elseif(e.message:findi("narandi")) then
			eq.signal(118351, 4000);
		end
	end
end
