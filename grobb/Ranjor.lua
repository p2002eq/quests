-- Converted to .lua by Speedz

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ya wanna be a member a Da Bashers. duz ya?  What making ya tink yooz is good nuff ta be one o' us?  Can ya proves ta me why I shouldn't oughtta just eat yer smelly hide?  I gonna tests ya. ya big. ugly peece o' meet.  Ya [willin ta test] or duz I just eats ya now?");
	elseif(e.message:findi("willin ta test")) then
		e.self:Say("Stoopid meat.  I gonna eats ya anyways sumday.  Brings me a froglok meat and two dem li'l froglok tadpole fleshes.  Dey berry good.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.trade, {item1 = 18790})) then -- Tattered Note
		e.self:Say("Arhh.. Ranjor mighty warrior.. Ranjor teach you warrior.. you fight for Ranjor now.");
		e.other:Ding();
		e.other:SummonItem(13528);  -- Mud Covered Tunic
		e.other:Faction(66,5,0);  	-- Da Basher
		e.other:Faction(22,-10,0);  -- Broken Skull Clan
		e.other:AddEXP(100);
	elseif (item_lib.check_turn_in(e.trade, {item1 = 5014, item2 = 5014, gold = 2})) then -- correct text needed
		e.self:Say("Raar.. Ranjor give yous a good weapon...");
		e.other:Ding();
		e.other:SummonItem(eq.ChooseRandom(94201,6022,6025,7014,5026));
	end
	-- do all other handins first with plugin, then let it do disciplines
	item_lib.return_items(e.self, e.other, e.trade)
end
