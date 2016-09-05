-- Converted to .lua by Speedz

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings " .. e.other:GetName() .. ". When a hero of our world is slain their soul returns to the place it was last bound and the body is reincarnated. As a member of the Order of Eternity  it is my duty to [bind your soul] to this location if that is your wish.");
	    e.self:Say("Or if you would like to be teleported to the [Arena], let me know.");
	    e.self:Say("Or ask for [buffs] if you are heading out to adventure.");
	elseif(e.message:findi("bind my soul")) then
		e.self:Say("Binding your soul. You will return here when you die.");
		e.self:CastSpell(2049,e.other:GetID(),0,1);
	--elseif(e.message:findi("illusion")) then -- Halloween Event	
	--	e.other:SetRace(eq.ChooseRandom(58,216,123,230,85,108,151,154,161,131,181,243,252));
	elseif(e.message:findi("arena")) then	
		e.other:MovePC(77, 1265, -73, 1.8, 253);
	elseif(e.message:findi('buff')) then
		e.self:SpellFinished(1447,e.other);
		e.self:SpellFinished(3235,e.other);
		e.self:SpellFinished(2590,e.other);
		e.self:SpellFinished(2517,e.other);
		e.self:SpellFinished(1939,e.other);
		e.self:SpellFinished(1939,e.other);
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
