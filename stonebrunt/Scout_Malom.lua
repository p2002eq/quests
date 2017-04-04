-- Scout_Malom (100503) in Stonebrunt for BST epic

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("It is a pleasure to meet you, but I do not have time to speak. I am waiting on official word from Shar Vahl. If you have been sent to assist me, please show me the Official Seal of the Khati Sha at this time. If you are not such a person, please carry on with your business and leave me to tend to mine.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 9031})) then -- Official Seal of the Khati Sha
		e.self:Say("Thank you for coming. I am surprised that you were able to find me. I barely know where I am at this point. I followed the vile beast that has been corrupting the spirits, but he eluded me after I followed him to that ridge up there. Fortunately, the spirit that you seek has remained at the site of its transformation. Use levitation to work your way up the falls and return to me with the totem that you will acquire from releasing the spirit.");
		local spawnx = -3711;
		local spawny = 3325;
		local spawnz = 1340;
		
		eq.local_emote({ e.self:GetX(), e.self:GetY(), e.self:GetZ() }, 1, 200, "Something glows brightly from high above the falls.")
		eq.spawn2(100501,0,0,spawnx,spawny,spawnz,0); -- The_Spirit_of_Torment

	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 9040})) then -- Totem of the Watcher
		e.self:Say("Great work, friend. Take this totem and place it in the case that you were given in Shar Vahl. Do not unwrap the totem and be quick in your pursuit of the others. Once you have all of the totems, please seal the case and return it to Shar Vahl. I can only hope that you will get to all of the spirits in time. Take care, friend.");
		e.other:SummonItem(9031); -- Returns Official Seal of the Khati Sha
		e.other:QuestReward(e.self,0,0,0,0,9041); -- Wrapped Watcher Totem
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
