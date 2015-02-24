function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("May the power of Underfoot be with you. Welcome. I am here to serve the will of the king as should you. If you [need healing], then speak. Or perhaps you are here to [return skunk glands]?");
	elseif(e.message:findi("healing")) then
		e.self:Say("Before the power of Underfoot can attempt to bind your wounds you must pay tribute. Three gold coins!!");
	elseif(e.message:findi("glands")) then
		e.self:Say("I have made an offer to all clerics of this cathedral. I shall reward one cleric scroll from our scribes for the return of four skunk scent glands. This offer is best left to our clerics.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {gold = 3})) then
		e.self:Say("Be healed!");
		e.self:CastSpell(17,e.other:GetID(),0,1);	--Light Healing
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 14030, item2 = 14030, item3 = 14030, item4 = 14030})) then --Skunk Scent Gland
		e.self:Say("I thank you for your good deed. I trust it was not a problem. Take this scroll. A cleric of this cathedral will find it useful. May the power of Underfoot be with you.");
		e.other:SummonItem(eq.ChooseRandom(15203,15229,15560,15036,15216)); --Random Spell: Cure Poison, Fear, Furor, Gate, Stun
		e.other:Faction(44,5); 			--Clerics of Underfoot
		e.other:Faction(169,5); 		--Kazon Stormhammer
		e.other:Faction(219,5); 		--Miners Guild 249
		e.other:AddEXP(2000);
		e.other:GiveCash(0,5,0,0); 		--Silver x 5
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
