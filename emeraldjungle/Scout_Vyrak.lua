-- Scout_Vyrak (94246) in EJ for BST Epic

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("It is a pleasure to meet you. but I do not have time to speak.  I am waiting on official word from Shar Vahl.  If you have been sent to assist me. please show me the Official Seal of the Khati Sha at this time.  If you are not such a person, please carry on with your business and leave me to tend to mine.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 9031})) then -- Official Seal of the Khati Sha
		e.self:Say("Well met, " .. e.other:GetName() .. ", well met indeed I find comfort in the fact that the jungle permitted your passage to me! Maybe there is still hope we can stop this disturbance before any more damage can be done to the balance of the spirit realm. I have spent several weeks tracking the corrupted spirit. It seems to have made a home of the ruins just south of here. The spirit no longer resembles he entity that it once was. It is quickly becoming something foul and savage. Let us hope that you are not too late.");
		e.self:Say("Destroy the spirit's current form and you will be able to retrieve the implement which has befouled it. Once you gather that totem please return it to me and I will wrap it so that you may carry it in the case that you were given in Shar Vahl.");
		local spawnx = 4162;
		local spawny = 1443;
		local spawnz = -45;
		
		eq.local_emote({ e.self:GetX(), e.self:GetY(), e.self:GetZ }, 1, 200, "You hear a massive creature roar as if awakened from a deep sleep.")
		eq.spawn2(94247,0,0,spawnx,spawny,spawnz,0); -- The_Spirit_of_Rage

	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 9038})) then -- Totem of the Gorilla
		e.self:Say("Excellent work, " .. e.other:GetName() .. "! Judging by the speed with which it altered that spirit, this totem must be extremely powerful. I've wrapped it, so you should be safe from its magic. Just be sure to keep it in the case. Once you have all of the totems, seal the case and make your way back to Shar Vahl. They will be waiting for you there. I'll continue to look for the person that perpetrated this vile act.");
		e.other:SummonItem(9031); -- Returns Official Seal of the Khati Sha
		e.other:QuestReward(e.self,0,0,0,0,9039); -- Wrapped Gorilla Totem
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
