--hillary
function event_timer(e)
	if (e.timer == "phrase") then
		phrase = eq.ChooseRandom(1,2,3,4,5);
		if (phrase == 1) then
			e.self:SetAppearance(3);
			e.self:Emote("collapses and breaks her arm.");
		elseif (phrase == 2) then
			e.self:Say("You're Deplorable.");
		elseif (phrase == 3) then
			e.self:Say("I'm a progressive. But I'm a progressive who likes to get things done.");
		elseif (phrase == 4) then
			e.self:Say("In my white house, you will know who wears the pant suits.");
		elseif (phrase == 5) then
			e.self:Say("We're going to take things away from you on behalf of the common good.");
		end
	end
end

function event_combat(e)
	if (e.joined) then
		eq.set_timer("phrase",45000);
	end
end

