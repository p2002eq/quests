function event_combat(e)
	if(e.joined) then
		local cur_target = e.self:GetHateTop();
		local randtext = eq.ChooseRandom(0,1,2);
		local classNum = e.other:GetClass();
		local class;
		if (classNum == 1) then
			class = "Warrior";
		elseif (classNum == 2) then
			class = "Cleric";
		elseif (classNum == 3) then
			class = "Paladin";
		elseif (classNum == 4) then
			class = "Ranger";
		elseif (classNum == 5) then
			class = "Shadow Knight";
		elseif (classNum == 6) then
			class = "Druid";
		elseif (classNum == 7) then
			class = "Monk";
		elseif (classNum == 8) then -- had to do all this as e.other:Class() was not working as it should - Speedz -
			class = "Bard";
		elseif (classNum == 9) then
			class = "Rogue";
		elseif (classNum == 10) then
			class = "Shaman";
		elseif (classNum == 11) then
			class = "Necromancer";
		elseif (classNum == 12) then
			class = "Wizard";
		elseif (classNum == 13) then
			class = "Magician";
		elseif (classNum == 14) then
			class = "Enchanter";
		elseif (classNum == 15) then
			class = "Beastlord";
		end
		if(cur_target) then
			e.self:Say(string.format("Time to die %s!",e.other:GetCleanName()));
			if(randtext == 0) then
				e.self:Say("" .. class .. " like you are an affront to my senses!");
			elseif(randtext == 1) then
				e.self:Say("" .. class .. " like you always bring out the worst in me!");
			elseif(randtext == 2) then
				e.self:Say("It's " .. class .. " like you that insult all of Norrath!");
			end
		end
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
