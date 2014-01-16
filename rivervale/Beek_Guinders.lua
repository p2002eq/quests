function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("waves enthusiastically and says, Hay, ho, there, young " .. e.other:Race() .. "!  I'd love to yak it up with you but I'm a bit busy at the moment, trying to find some [help].");
	elseif(e.message:findi("help")) then
		e.self:Say("Well, we're experimenting with some tanning methods but we're running low on supplies. We need to find someone to go out and [gather some things]. Seems no one wants to do an honest day's work any more. I'd do it myself but, errrr, my, uhhh, foot hair has been hurting lately... yes, that's it.");
	elseif(e.message:findi("gather some thing")) then
		e.self:Say("Ahhh, excellent! Okay, first, we'll need a couple of wolf pelts. They don't have to be perfect, completely ruined would work just fine, hehe. I'll also need a black wolf skin and a handful of berries. The berries you should be able to find out in the Thicket. I hear they grow in a small canyon near the lone tower. Hurry, hurry!");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18731})) then -- Tattered Note
		e.self:Say("Aye. Welcome. my fur-footed friend. My name is Beek Guinders. and I am guildmaster here at the Chapel of Mischief. Here is our guild tunic. Wear it with pride, as it will set you apart from the crowd.");
		e.other:SummonItem(13538); -- Faded Gold Felt Tunic*
		e.other:Ding();
		e.other:Faction(259,10,0); -- Priest of Mischief
		e.other:Faction(208,10,0); -- Mayor Gubbin
		e.other:Faction(133,10,0); -- Guardian of the Vale
		e.other:AddEXP(100);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13045,item2 = 13782,item3 = 13782,item4 = 13758})) then -- Tattered Note
		e.self:Say("Hey, great! You found the materials! We'll get to work right away. If you find any more, please come by again. Here's a little something for your troubles, friend.");
		e.other:SummonItem(eq.ChooseRandom(15014,15201,15207,15208,16303));
		e.other:Ding();
		e.other:Faction(259,10,0); -- Priest of Mischief
		e.other:Faction(208,10,0); -- Mayor Gubbin
		e.other:Faction(133,10,0); -- Guardian of the Vale
		e.other:AddEXP(100);
		e.other:GiveCash(23,13,0,0);
	else
		e.self:Say("Whoooops! I'll need the two ruined wolf pelts along with the berries and black wolf skin before I can reward you, " .. e.other:GetName() .. ". Don't dawdle.");
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:rivervale  ID:19111 -- Beek_Guinders