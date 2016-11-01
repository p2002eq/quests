function event_timer(e)
	if (e.timer == "phrase") then
		phrase = eq.ChooseRandom(1,2,3,4,5);
		if (phrase == 1) then
			e.self:SetAppearance(64);
			e.self:Say("You're FIRED!");
		elseif (phrase == 2) then
			e.self:Say("Sometimes by losing the battle, you find a way to win the war.");
		elseif (phrase == 3) then
			e.self:Say("My whole life is about winning.  I don't lose often.  I almost never lose.");
		elseif (phrase == 4) then
			e.self:Say("I actually don't have a bad hair line.");
		elseif (phrase == 5) then
			e.self:Say("Hillary is a nasty woman.");
		end
	end
end

function event_combat(e)
	if (e.joined) then
		eq.set_timer("phrase",45000);
	end
end

