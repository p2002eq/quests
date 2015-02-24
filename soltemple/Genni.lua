-- Quests for Bard Lambent Stones

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I am Genni of the temple of Solusek Ro. I serve as custodian of the [lambent stones].");
	elseif(e.message:findi("lambent stones")) then
		e.self:Say("Lambent stones are receptacles of power. Alone they are not useful, but when combined with other gemstones they can be used for making magic items. I know of [star ruby] lambent, [ruby] lambent, [sapphire] lambent and [fire opal] lambent.");
	elseif(e.message:findi("ruby")) then
		if(e.message:findi("star")) then
			e.self:Say("To make a star ruby lambent stone, you must give me two star rubies and a lambent stone. Lambent stones can be found on hill giants, sand giants and griffons.");
		
		else
			e.self:Say("My Sister Vilissia holds the secrets to making ruby lambent stones. Though she will not speak of it, if you give her two rubies and a lambent stone, she will make you ruby lambent.");
		end
	elseif(e.message:findi("sapphire")) then
		e.self:Say("My Brother Gardern holds the secret to making sapphire lambent stones. Though he will not speak of it, if you give him two sapphires and a lambent stone, he will make you sapphire lambent.");
	elseif(e.message:findi("fire opal")) then
		e.self:Say("My Brother Ostorm holds the secret to making fire opal lambent stones. Though he will not speak of it, if you give him two fire opals and a lambent stone, he will make you fire opal lambent. If you are interested, I can [sell] you a [fire opal].");
	elseif(e.message:findi("sell")) then
		e.self:Say("I will sell you a fire opal for 550 golden coins. Remember, gold! The metal of fire for a gem of fire.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 10032, item2 = 10032, item3 = 10000})) then
		e.self:Say("Here is your prize - a lambent star ruby.");
		e.other:Faction(320,5);
		e.other:Faction(291,-5);
		e.other:QuestReward(e.self,0,0,0,0,10117);
	elseif(item_lib.check_turn_in(e.trade, {gold = 550})) then
		e.self:Say("Here is your prize - a lambent star ruby.");
		e.other:Faction(320,5);
		e.other:Faction(291,-5);
		e.other:QuestReward(e.self,0,0,0,0,10117);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 16507})) then
		e.self:Say("I see that Gavel has sent you to me. Very well, I have galvanized your platinum bar - take it.");
		e.other:QuestReward(e.self,0,0,0,0,19047); --Galvanized Platinum
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------