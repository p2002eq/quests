-- Scout_Ahlikal (47197) in the Feerrott for BST Epic
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("It is a pleasure to meet you, but I do not have time to speak. I am waiting on official word from Shar Vahl. If you have been sent to assist me, please show me the Official Seal of the Khati Sha at this time. If you are not such a person, please carry on with your business and leave me to tend to mine.");
	end
end
    
function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 9031})) then -- Official Seal of the Khati Sha
		e.self:Say("Well met, I'm glad that you made it! This jungle is oppressive, with its dank earth and dark canopy. The sooner you dispatch that spirit, the sooner we can both make our way out of this vile place. Move towards the ruins that lie about two hundred feet from here. The spirit will be there. Release it from its current form and return the totem to me. I will wrap it for you, so that you may place it in the container that you should have been given. Take care and be swift!");
		local spawnx = -2750;
		local spawny = 1065;
		local spawnz = -2;
		eq.local_emote({ e.self:GetX(), e.self:GetY(), e.self:GetZ() }, 1, 200, "A large yellow spider drifts down from the jungle canopy. Perhaps it senses the proximity of its next meal.")
		eq.spawn2(4720.05,0,0,spawnx,spawny,spawnz,0); -- The_Spirit_of_Decay
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 9032})) then -- Totem of the Spider
		e.self:Say("Amazing work, " .. e.other:GetName() .. "! We are all in your debt. I have wrapped the totem to prevent its harmful magic from affecting you. Please keep it in the box until you can return it to Elder Dumul. If you have not found the other spirits, please seek them out. If you have filled the container, please seal it and return to Shar Vahl. Here is your seal. May the spirits watch over you.");
		e.other:SummonItem(9031); -- Returns Official Seal of the Khati Sha
		e.other:QuestReward(e.self,0,0,0,0,9033); -- Wrapped Spider Totem
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
