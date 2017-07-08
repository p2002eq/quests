-- Spirit Wracked Cord
function event_say(e)
	if(e.other:GetFaction(e.self)==1) then -- Only if you are ally with Sarnaks
		if(e.message:findi("hail")) then
			e.self:Say("Hail, minion! It is good to see a member of a lesser race striving to improve themself through service to the Dizok. We are feeling especially generous as of late, and if you would do us a [service], we shall reward you handsomely.");
		end
		if(e.message:findi("service")) then
			e.self:Say("We are not sure you are worthy, but shall assign you this task in hopes you prove mighty enough to resolve it. Gather your broodlings about you, and journey to Charasis. There you shall find a Urn of spirits. We require this, as well as [additional components].");
		end
		if(e.message:findi("additional components")) then
			e.self:Say("Very well, if you feel you are up to it, lead your broodlings to fallen Sebilis and return to us with a portion of undead dragon sinew. Bring us the Sinew, the Urn, and your Regal Band of Bathezid as proof of service, and a worthy reward shall be yours.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(e.other:GetFaction(e.self)==1) then -- Ally faction
		if(item_lib.check_turn_in(e.self, e.trade, {item1 = 6477, item2 = 6478, item3 = 5727})) then -- Spirit Wracked Urn, Undead Dragon Sinew and Regal band of Bathezid
			e.self:Say("Amazing! You have returned the trophies I asked for, against impossible odds. Here is your reward, worthy minion, may it serve you well.");
			e.other:Faction(281,50); -- Sarnak Collective
			e.other:Faction(384,-30); -- Mountain Death Clan
			e.other:SummonItem(5727); -- Regal Band of Bathezid
			e.other:QuestReward(e.self,0,0,0,0,5723,100000); -- Spirit Wracked Cord
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end