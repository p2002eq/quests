function event_enter_zone(e)
	e.self:BuffFadeAll();
	if (e.self:GetGM() == false) then
		if (e.self:HasItem(10780)) then
			e.self:SetRace(89);
			e.self:SetTexture(2);
		elseif(e.self:HasItem(10781)) then
			e.self:SetRace(89);
			e.self:SetTexture(3);
		else
			e.self:DeleteItemInInventory(29,1);
			e.self:SpellFinished(2049,e.self,0,0);
			if (eq.ChooseRandom(1,2) == 1) then
				e.self:SummonItem(10780, 1, false, 29);  --maclive
--				e.self:SummonItem(10780, 1, 0, 0, 0, 0, 0, false, 29); 
				e.self:SetRace(89);
				e.self:SetTexture(2);
			else
				e.self:SummonItem(10781, 1, false, 29);  --maclive
--				e.self:SummonItem(10781, 1, 0, 0, 0, 0, 0, false, 29); 
				e.self:SetRace(89);
				e.self:SetTexture(3);
			end
		end
	end
end