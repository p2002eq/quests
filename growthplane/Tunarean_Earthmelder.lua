function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, my friend. Unfortunately I cannot talk right now. The [" .. eq.say_link("giants") .. "] must be dealt with.");
    elseif(e.message:findi("giants")) then
		e.self:Say("The giants are continuing to put forth efforts to encroach the lands blessed by Tunare. We need an [" .. eq.say_link("outrider") .. "] or [" .. eq.say_link("preserver") .. "] to aid us in our continued fight.");
    elseif(e.message:findi("preserver")) then
		e.self:Say("Noble preserver, you will be needed to combat the priests of the warbringer. Scouts have reported three priests wandering the Wakening Lands in search of a site to build a shrine to their god. Seek them out, kill them, and bring their heads and those of anyone else involved.");
    elseif(e.message:findi("outrider")) then
		e.self:Say("We have need of you to disrupt the construction efforts of the giants in the Wakening Land. Find the frost giant overseer, kill him and any others that are responsible for the building and bring back their heads.");
    end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 31424, item2 = 31425, item3 = 31426, item4 = 31423})) then
		e.self:Say("May Tunare's blessing be upon thee! Here, take this item and use it wisely.");
		e.other:QuestReward(e.self,0,0,0,0,1208,1000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 31419, item2 = 31420, item3 = 31421, item4 = 31422})) then
		e.self:Say("May Tunare's blessing be upon thee! Here, take this item and use it wisely.");
		e.other:QuestReward(e.self,0,0,0,0,1207,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end