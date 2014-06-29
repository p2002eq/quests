function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("'Greetings, " .. e.other:GetName() .. ". I am Rykas, chronicler of knowledge. I have journeyed all throughout the lands of Norrath, and I have learned many tales of adventure from people I have encountered during my travels. I have learned of legends known and unknown to most mortals. Are you in search of knowledge?");
	elseif(e.message:findi("knowledge")) then
		e.self:Say("A small task is needed if you wish to learn more. Do you wish to learn the tale of Magi'kot?");
	elseif(e.message:findi("Magi'kot")) then
		e.self:Say("If you seek to learn the tale of Trilith Magi'kot, your journey shall begin in the Commonlands. Search for Jahsohn Aksot and give him this token. He will share some of the knowledge I have bestowed upon him, and point you further down your path to Mastery. Bring me the Words of Mastery, Power of the Elements, and the Words of Magi'kot....Then you shall learn more about the power of the orb.");
		e.other:SummonItem(28035);
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 28003, item2 = 28004, item3 = 28031})) then
		e.self:Say("I see that you have completed the quest I laid before you. That speaks well of your dedication, yet you do not realize your journey has just begun. Study this tome.");
		e.other:SummonItem(18958);
		e.other:AddEXP(2000);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
