--Shaman Skull Quest 6

function event_say(e)
	local qglobals = eq.get_qglobals(e.other,e.self);
	if(e.message:findi("Hail")) then
		e.self:Say("What?!! Who has [sent] you to me? Bah!! Away with you.");
	elseif(e.message:findi("Zand") and tonumber(qglobals.shmskullquest) > 7 and e.other:GetFaction(e.self) < 6) then
		e.self:Say("I await you, Cradossk . My sisters and I yearn for the return of our skulls. We are the [Sisters of Scale]. Find us and bring to this hierophant our skulls and your iron cudgel of the Channeler. Go.");
	elseif(e.message:findi("Sisters") and tonumber(qglobals.shmskullquest) > 7 and e.other:GetFaction(e.self) < 6) then
		e.self:Say("My, what a mess!! Hmmph!! What did you say? Sisters of Scale? They were a legendary trio of mystics. We once had their skulls sealed within this temple, but now they are lost. I sent a channeler to retrieve them. His name was Vagnar. I am sure he shall find them.");
	elseif(e.message:findi("vagnar") and tonumber(qglobals.shmskullquest) > 7 and e.other:GetFaction(e.self) < 6) then
		e.self:Say("'He's a capable channeler, I trust he knows where to look and will prepare himself. Any competent servant of our Lord would prepare potions and supplies before going on such a quest. If he doesn't come back, it's no great loss, he wasn't Hierophant material anyway.");
	end
end

function event_trade(e)
	local qglobals = eq.get_qglobals(e.other,e.self);
	local item_lib = require("items");
	--Turn in the skulls of the sisters of scale and your cudgel of the channeler
	if(item_lib.check_turn_in(e.trade, {item1 = 5145, item2 = 12748, item3 = 12750, item4 = 12749})and e.other:GetFaction(e.self) < 6 and tonumber(qglobals.shmskullquest) > 7) then
		e.self:Say("You have returned the skulls of the Sisters of Scale. For this you shall be rewarded. Take this hierophant's weapon. May you use it to smite the foes of our people.' Dexl comes out of the trance. 'What?!! Whew. Hey!! Where is my cudgel?");
		eq.set_global("shmskullquest","9",5,"F"); 	--set a global flag so that user can do shm skull quest part 7
		e.other:SummonItem(5146); 					--Give the player The Cudgel of the Hierophant
		e.other:Faction(282, 10); 					--Scaled Mystics
		e.other:Faction(193, 10); 					--Legion of Cabilis
		e.other:AddEXP(140000); 					--give decent xp...
		e.other:GiveCash(0,0,0,10);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
