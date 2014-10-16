--Warrior Tomes/Planar Armor Exchange
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("glares coldly, his mouth twisted in a gruesome sneer of disgust. 'Kartis is place of shadow, not gud for light crawlers. But yu here, yu want something from shadow? Yes, yu want shadow to teach yu - yu want shadow to feed yu secrets, but yu will only fuel shadow's power in learning from it. If yu still want to stay in Kartis, then yu will only give power to shadow that yu say yu hate. I will teach yu, light crawler, if yu still tink yu can outsmart shadow's soldiers. I'll make that puny stick-thing yu light crawlers call weapons into fierce tools of war and no matter who dey kill, yu will kill in the shadow's name.'");
	end
end
function event_trade(e)
	local item_lib = require("items");
	if((item_lib.check_turn_in(e.trade, {item1 = 4911})) or (item_lib.check_turn_in(e.trade, {item1 = 4912})) or (item_lib.check_turn_in(e.trade, {item1 = 4913})) or (item_lib.check_turn_in(e.trade, {item1 = 4914})) or (item_lib.check_turn_in(e.trade, {item1 = 4915})) or (item_lib.check_turn_in(e.trade, {item1 = 4916})) or (item_lib.check_turn_in(e.trade, {item1 = 4917}))) then --Indicolite Armor
		e.self:Say("Thank you, " .. e.other:GetName() .. "."); --Text made up
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(10028, 10037, 22503, 15981),698775); --Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
