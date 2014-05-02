function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("You [Greenblood]?");
	elseif(e.message:findi("greenblood")) then
		e.self:Say("Good, you mine.  We tuffest, bestest, scariest warriors in da Norrath.  Not like dem wimpy Craknek hoomie wannabees.  You Greenblood, you my toy.  You lives or dies at my will.  Go, brings me many lizard meats cause I Greenblood leader and I berry hungry lots.  So hungry dat I eats four lizards.  Go bring meat or I eats you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18789})) then
		e.self:Say("Soonog own you now.. fight for Soonog.. Soonog make you strong.. Soonog army rule all!!");
		e.other:SummonItem(13527);
		e.other:Faction(128,100);  	-- Green Blood Knight
		e.other:Faction(46,50);   	-- Clurg
		e.other:Faction(314,-15); 	-- Storm Guard
		e.other:Faction(292,-15); 	-- Shadowknight of Night Keep
		e.other:Ding();
		e.other:AddEXP(100);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 13410, item2 = 13410, item3 = 13410, item4 = 13410})) then
		e.self:Say("Small meats but is good nuff.  You take dis and go kill eberyting.  Make all scared of da Greenblood knights.  You get ready for next inb.. ins.. invat.. you get ready for next war.  You learning stuff, you come bak here and me teach you more Greenblood stuf so we be more tuffest.");
		e.other:SummonItem(5023);
		e.other:Faction(128,5);  	-- Green Blood Knight
		e.other:Faction(46,5);   	-- Clurg
		e.other:Faction(314,-10); 	-- Storm Guard
		e.other:Faction(292,-10); 	-- Shadowknight of Night Keep
		e.other:Ding();
		e.other:AddEXP(50);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
