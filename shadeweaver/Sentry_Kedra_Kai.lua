---- Quest:Insect Carapace Shields
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Well met wanderer. Pay heed to the road you chose to travel on, for there are many [hazards] you may come across no matter which direction you chose.");
	elseif(e.message:findi("hazards")) then
		e.self:Say("The western road passes through a dangerous part of the thickets. A rivalry between the strange Tegi clans is afoot. Pay close attention, for the darker ones seem much more hostile than the ones that came before them. The Northern road passes through to the [Paludal] caverns. Once it was a rather safe trade route to the city of Shadow Haven. It has since fallen to regular brigand attacks.. We still get traders coming to sell their wares, but the journey is far more treacherous these days.");
	elseif(e.message:findi("paludal")) then
		e.self:Say("What is Paludal? The Paludal caverns mark the trade route to Shadowhaven. A series of tunnels that burrow into the very heart of Luclin. I would be very careful of the creatures that burrow through these caverns. They are very dangerous and will show no mercy on young adventurers. If you come across these creatures bring me four different carapaces shells and I will reward you with a shield made from them.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10646, item2 = 10645, item3 = 10644, item4 = 10647})) then -- Grime Tunneler Carapace, Muck Digger Carapace, Mud Burrower Carapace & Sediment Delver Carapace
		e.self:Say("YI see that you have survived in Paludal and you have returned to me with the carapaces. Take this shield and use it in battle young adventurer.");
		e.other:QuestReward(e.self,0,0,0,0,34031,1000); -- Paludal Carapace Shield
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
