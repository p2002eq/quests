
function event_combat(e)
  if(e.joined == true) then
	randomize = math.random(1,3);
	if(randomize == 1) then
		e.self:Say("Time to die " .. e.other:GetName() .. "!");
	elseif(randomize == 2) then
		e.self:Say("I shall rid the land of another infamous villain!");
	elseif(randomze == 3) then
		e.self:Say("Your foul deeds have earned my contempt!");
	end
  end
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("The boss might need some help!");
		eq.move_to(336,10,45);
	end
end