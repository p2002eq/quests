function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome. Welcome!!  Time to train.  Time to fight.  Time to serve the Iksar Empire.  You will need weapons.  I have the [footman pike] for all new recruits to earn.");
	elseif(e.message:findi("pike")) then
		e.self:Say("A footman pike is what you need.  A footman pike is what you get, but earn it you will.  You must [slay many beasts] to prove to us that you are a true warrior.  Fail and you will be exiled to live with the Forsaken.");
	elseif(e.message:findi("beasts")) then
		e.self:Say("Yes.  You will slay or you will be slain.  Take this footman's pack and fill it you will.  Fill it with [weapons of our foes].  When all are combined, the full footman's pack shall be returned to me along with your militia pike.  Do this and earn your footman pike and then we may have a true mission for you.");
		e.other:SummonItem(17027);
	elseif(e.message:findi("weapons")) then
		e.self:Say("Yes.  You need to know the weapons required.  Fill the pack with javelins.  Froglok bounder and goblin hunter javelins.  Two of each.");
	elseif(e.message:findi("moglok")) then
		e.self:Say("My dear friend, Warlord Hikyg of the Swamp Gate has encountered some difficulty with a Trooper Moglok. He requested that I find a brave soldier to take charge of the situation. Are you willing to [assist Warlord Hikyg]?");
	elseif(e.message:findi("Hikyg")) then
		e.self:Say("Good. Take this note to Footman Moglok of the swamp garrison. He shall instruct you on your mission.");
		e.other:SummonItem(18234);
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 12430, item2 = 5131})) then
		e.self:Say("Kyg knew you could do it. You will make a fine legionnaire some day but, for now, you shall be a footman. Take the footman pike head plans. Forge the footman's pike. Do so, and then you may have an audience with the War Baron on the subject of his [Memory of Sebilis].");
		e.other:SummonItem(12475);
		e.other:Faction( 30,2);
		e.other:Faction( 193,2);
		e.other:Faction( 282,2);
		e.other:Faction( 317,2);
		e.other:Faction( 62,2);
		e.other:AddEXP(500);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
