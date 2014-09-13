function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail. " .. e.other:GetName() .. "! I trust you are not afraid of heights. Kelethin is a grand city. but it is also a safe haven from predators and evil beings. About the only thing to fear are the [pixie tricksters].");
	elseif(e.message:findi("pixie trickster")) then
		e.self:Say("An irritating lot of fairy folk. They have been starting fires in our great forest. They may just burn our grand community down. We will have to [exterminate the pixies]. It is unfortunate. but it is for the good of the entire forest.");
	elseif(e.message:findi("exterminate the pixie")) then
		e.self:Say("Faydark's Champions cannot call you foe. but you have yet to earn our trust."); 
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 12109 })) then -- Pouch of Pixie Dust
		e.self:Say("Good work. scout!!  You have earned this reward.  It is all we have at the time.  I am certain you are satisfied.  If not, then do not let me hear of it.");
		e.other:Faction(283, 1); -- Scouts of Tunare
		e.other:QuestReward(e.self,0,math.random(9),0,0,0,800);
		if(math.random(100) < 20) then
			e.other:SummonItem(eq.ChooseRandom(2104, 2106, 2108, 2111, 2112)); -- Patchwork Tunic, Patchwork Cloak, Patchwork Sleeves, Patchwork Pants, Patchwork Boots
		end
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:gfaydark  ID:54104 -- Ran_Sunfire 