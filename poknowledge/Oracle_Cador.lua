--Willamina's Needles/Planar Armor Exchange
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("gives a stiff nod in proper greetings to " .. e.other:GetName() .. ". 'The light of Selia shines in welcoming, friend. If you seek supplies or training, know that Selia will accommodate your every need in these specific areas most efficiently -- for that is what we have striven for in the recent past with the unexpected, though eagerly welcome influx of Norrath's heroes. I am Oracle Cador, shaman of The Truthbringer and adept of my art in the district of Selia. I shall oblige any needs that you may have now or in the future regarding training in the shamanistic ways. If you are of another adept path, then do not be disheartened for Selia holds an adept master for every art that the pure light of goodly mortal virtues shines upon.'");
	elseif(e.message:findi("black lava powder")) then
		e.self:Say("You are most astute. I do have a stock of black lava powder with me, but I will only share it with those who prove themselves worthy. Onirelin Gali is currently in possession of an artifact I need to better commune with the spirits. Please recover it for me.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 28089})) then--Cador's Artifact
		e.self:Say("The spirits are restful now that this piece of legend is in safe hands. You may take this to Mirao for whatever purpose he desires it for. May your vision always be clear!");
		e.other:QuestReward(e.self,0,0,0,0,28090,250); --Black Lava Powder
	end
	if((item_lib.check_turn_in(e.trade, {item1 = 4871})) or (item_lib.check_turn_in(e.trade, {item1 = 4872})) or (item_lib.check_turn_in(e.trade, {item1 = 4873})) or (item_lib.check_turn_in(e.trade, {item1 = 4884})) or (item_lib.check_turn_in(e.trade, {item1 = 4874})) or (item_lib.check_turn_in(e.trade, {item1 = 4875})) or (item_lib.check_turn_in(e.trade, {item1 = 4876})) or (item_lib.check_turn_in(e.trade, {item1 = 4877}))) then --Rune Etched Armor
		e.self:Say("Thank you, " .. e.other:GetName() .. "."); --Text made up
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(10028, 10037, 22503, 15981),698775); --Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
