-- Converted to .lua by Speedz

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings " .. e.other:GetName() .. ". When a hero of our world is slain their soul returns to the place it was last bound and the body is reincarnated. As a member of the Order of Eternity  it is my duty to [bind your soul] to this location if that is your wish.");
        e.self:Say('If you want plat just say [plat]');
        e.self:Say('If you want buffs just say [buff]');
        e.self:Say('If you want your corpses just say [corpses]');
        e.self:Say('If you want [items], ask me more');
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
		if (itemId + 5) then
			e.other:SummonItem(tonumber(itemId));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
