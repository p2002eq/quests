-- Converted to .lua by Speedz

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings " .. e.other:GetName() .. ". When a hero of our world is slain their soul returns to the place it was last bound and the body is reincarnated. As a member of the Order of Eternity  it is my duty to [bind your soul] to this location if that is your wish.");
        e.self:Say('If you want plat just say [plat]');
        e.self:Say('If you want buffs just say [buff]');
        e.self:Say('If you want your corpses just say [corpses]');
        e.self:Say('If you want [items], ask me more');
        e.self:Say('If you want to change levels, say [level] and a number from 1 to 60');
        e.self:Say('If you want to be teleported to arena, say [arena]');
	elseif(e.message:findi("bind my soul")) then
		e.self:Say("Binding your soul. You will return here when you die.");
		e.self:CastSpell(2049,e.other:GetID(),0,1);
	elseif(e.message:findi("plat")) then
        e.other:AddMoneyToPP(0, 0, 0, 2500, true);
    elseif(e.message:findi('buff')) then
		e.self:SpellFinished(3025,e.other);
		e.self:SpellFinished(2696,e.other);
		e.self:SpellFinished(2680,e.other);
		e.self:SpellFinished(2696,e.other);
		e.self:SpellFinished(3023,e.other);
		e.self:SpellFinished(3022,e.other);
		e.self:SpellFinished(3024,e.other);
		e.self:SpellFinished(2517,e.other);
	--elseif(e.message:findi("illusion")) Halloween Event	
	--	e.other:SetRace(eq.ChooseRandom(58,216,123,230,85,108,151,154,161,131,181,243,252));
	elseif(e.message:findi('corpses')) then
	    eq.summon_all_player_corpses(e.other:CharacterID(), e.other:GetX(), e.other:GetY(), e.other:GetZ(), e.other:GetHeading());
	elseif(e.message:findi('items')) then
	    e.self:Say("I can summon you any item your heart desires, you have only to tell me [Summon Item] along with the item number.  The Allaclone is a good resource for that");
    elseif(e.message:findi('summon item')) then
        local itemId = string.gsub(string.gsub(e.message,"summon item","")," ","");
		if (tonumber(itemId)) then
		    if (tonumber(itemId) == 2660) then
		        e.self:Say("GM Uber Weapon? Only GM's are powerful enough to hold this without melting!");
		    else
			    e.other:SummonItem(tonumber(itemId),10);
			end
		end
	elseif(e.message:findi('level')) then
	    local level = string.gsub(string.gsub(e.message,"level","")," ","");
		if (tonumber(level)) then
			if(tonumber(level) > 60) then
				e.self:Say("Level 60 is the cap, what do you think this is, Planes of Power!");
			elseif (tonumber(level) > 0 and tonumber(level) < 61) then
				e.other:SetLevel(tonumber(level));
				for i = 0, 73 do
					if (e.other:CanHaveSkill(i)) then
						e.other:SetSkill(i,e.other:MaxSkill(i));
					end	
				end
			else
				e.self:Say("I need a valid number 1 to 60 if you want to level up.");
			end
		end
	elseif(e.message:findi("arena")) then	
		e.other:MovePC(77, 1265, -73, 1.8, 253);
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
