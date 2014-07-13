function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Need new members we do not. Powerful enough are we with Grevak. Still. peons needed. Are you a [new peon] or are you an [outsider]? Speak up!! Fool!! No time Grevak has!!");
	elseif(e.message:findi("i am a new peon")) then
		e.self:Say("So you think you can be greater than Grevak!! Touch you not and still I can smash you. I am a Greenblood shadowknight!! Peon are you. Peons go to swamps and slay lizardmen. You return with four lizardmen tails and a reward is yours. You return with two lizardman shaman dolls and a great reward is yours.");
	elseif(e.message:findi("i am an outsider")) then
		e.self:Say("Go away or soon your pain will find you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if  (item_lib.check_turn_in(e.trade, {item1 = 13354, item2 = 13354, item3 = 13354, item4 = 13354})) then
		e.self:Say("Grevak rewards peon with reward instead of smashing you.  Bring me more, peon!");	--Text made up
		e.other:SummonItem(13453,1);--Summon Pickled Lizard
		e.other:AddEXP(500);
		e.other:Faction(46,10);		-- Increase faction -- Clurg
		e.other:Faction(128,20);	-- Increase faction -- Greenblood Knights
		e.other:Faction(292,-20);	-- Decrease faction -- Shadowknights of Night Keep
		e.other:Faction(314,-10);	-- Decrease faction -- Storm Guard
		e.other:Ding();
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 13367, item2 = 13367})) then
		e.self:Say("Grevak rewards you. Grevak now afraid of nothing! Ha ha! Mighty mighty!");		--Text made up
		e.other:SummonItem(eq.ChooseRandom(13453,5013,5014,5025,5016,5019,5020,5023),1);			--Summon Random Rusty Shadowknight-Friendly weapon
		e.other:AddEXP(500);
		e.other:Faction(128,20);	-- Increase faction -- Greenblood Knights
		e.other:Faction(292,-20);	-- Decrease faction -- Shadowknights of Night Keep
		e.other:Ding();
	end
item_lib.return_items(e.self, e.other, e.trade)
end

-- Developer: Diuretic Effluent
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
