function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings " .. e.other:GetName() .. ". When a hero of our world is slain their soul returns to the place it was last bound and the body is reincarnated. As a member of the Order of Eternity  it is my duty to [" .. eq.say_link("bind my soul",false, "bind your soul") .. "] to this location if that is your wish.");
	elseif(e.message:findi("bind my soul")) then
		e.self:Say("Binding your soul. You will return here when you die.");
		e.self:CastSpell(2049,e.other:GetID(),0,1);
	--elseif(e.message:findi("illusion")) then -- Halloween Event	
	--	e.other:SetRace(eq.ChooseRandom(58,216,123,230,85,108,151,154,161,131,181,243,252));
	elseif(e.message:findi("Jaggedpine")) then
		e.other:MovePC(181, 1800, 1319, -14.78, 12);
	elseif(e.message:findi("Plane of Mischief")) then
		e.other:MovePC(126, -395, -1410, 112.85, 0);
	elseif(e.message:findi("arena")) then
		e.other:MovePC(77, 1265, -73, 1.8, 253);
	elseif(e.message:findi('buff')) then
		e.self:SpellFinished(3025,e.other);
		e.self:SpellFinished(2696,e.other);
		e.self:SpellFinished(2680,e.other);
		e.self:SpellFinished(2696,e.other);
		e.self:SpellFinished(3023,e.other);
		e.self:SpellFinished(3022,e.other);
		e.self:SpellFinished(3024,e.other);
		e.self:SpellFinished(2517,e.other);
	elseif(e.message:findi('corpses')) then
		eq.summon_all_player_corpses(e.other:CharacterID(), e.other:GetX(), e.other:GetY(), e.other:GetZ(), e.other:GetHeading());
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end