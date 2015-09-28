function event_say(e)
	if (e.message:findi("hail")) then
		e.self:Say("You have pervaded the inner core of the shrine, what brings your corporeal essence this far? Seek you to prove your worth to the lord and his kin?");
	elseif(e.message:findi("prove my worth")) then
		e.self:Say("So it shall be then that you will perform a task for the kin. As it happens, I was on a mission to speak with a [contact] of the shrine in the lands that do not sleep. This contact has vital information on the movements of the giants in that region and it is most important that we recover that information. Unfortunately, I have been called away on duty to further bolster our defenses and will not be able to meet with her.");
	elseif(e.message:findi("contact")) then
		e.self:Say("Her name is Eysa Florawhisper. She is a Countess from the Tunarean Court, of whom we are allied with in this fight against the giants. The court does not want the giants encroaching on the lands of Tunare, for they fear that the giants will cause great harm to the area, should they be allowed to control it. As you can see, this gives us a common enemy, which has forged an even stronger alliance between our two peoples. If you can deliver this report to her in my stead, she will give you the documents we need.");
		e.other:SummonItem(29067); --Note to Tunare's Court
	end	
end

function event_trade(e)
	local item_lib = require("items");

	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 29623})) then --Eysa's Token
		e.self:Say("Ah, excellent. You've returned with the papers we needed. There is some rather interesting information here that I'm sure the council will be glad to have in their possession, and it will allow for our further fortification against the giants. You have proven yourself to be an honorable ally and a friend to the shrine and we thank you for it. I cannot offer you much for this but in time, your actions may prove to be invaluable to the shrine and its kin.");
		e.other:Faction(42, 10); --CoV
		e.other:Faction(362, 10); --Yelinak
		e.other:Faction(189, -30); --Kromzek
		e.other:QuestReward(e.self, 4, 8, 8, 10, 0, 5000);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end