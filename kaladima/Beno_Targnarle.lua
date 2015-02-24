function event_say(e)
	local shifty = "Your shifty eyes tell me that you are no ally of the Stormguard.";
	local prove = "Prove yourself to the Stormguard and then we shall talk. Perhaps you may assist Master Canloe and show your worth to us.";
	if(e.message:findi("hail")) then
		e.self:Say("Step forth, young " .. e.other:GetName() .. "! I heard that you have come of age! The spirit of adventure has entered your body. That is good. Go and speak with the others. They shall help you. I am afraid I have no time to spend conversing. There is much I have to [ponder].");
	elseif(e.message:findi("ponder")) then
		if(e.other:GetFaction(e.self) < 5) then
			e.self:Say("Must you know everyone's business? Hmm.. Maybe you can be of assistance. You see, I have been instructed by Furtog to tend to a matter of extreme urgency, which is keeping me from clearing the mines of rats. Will you assist and [exterminate the rats]?");
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say(prove);
		else
			e.self:Say(shifty);
		end
	elseif(e.message:findi("exterminate")) then
		if(e.other:GetFaction(e.self) < 5) then
			e.self:Say("Very good! I shall reward you for every four giant rat pelts returned to me. And be on the lookout for a [metal rat]!");
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say(prove);
		else
			e.self:Say(shifty);
		end
	elseif(e.message:findi("metal")) then
		if(e.other:GetFaction(e.self) < 5) then
			e.self:Say("I cannot tell you how many reports I have heard of metal rats in Kaladim. I first thought it was a vision obtained from having too many Tumpy Tonics, but Furtog himself is said to have seen them. If you ever catch sight of the little metal beast, give chase!! Return its metal carcass to me and I shall reward you.");
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say(prove);
		else
			e.self:Say(shifty);
		end
	elseif(e.message:findi("matter")) then
		if(e.other:GetFaction(e.self) < 5) then
			e.self:Say("I am apprehensive about sending one who is so young out into the world, but I have a good feeling about you, " .. e.other:GetName() .. ". Someone has stolen the [Eye of Stormhammer]. You must journey to Antonica and go to a place called Highpass Hold. The rogue who has it is locked up in the prison. We have arranged for his extradition to Kaladim. Please give the jail clerk this note of release.");
			e.other:SummonItem(18935); -- Sealed Note
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say(prove);
		else
			e.self:Say(shifty);
		end
	elseif(e.message:findi("eye")) then
		if(e.other:GetFaction(e.self) < 6) then
			e.self:Say("The great statue of Kazon Stormhammer was once encrusted with two great gems from the mines of Butcherblock. So big were they that it took the magic of the high elves to assist us in lifting them to the statue's face. In the year 2995, somehow, someone stole one of the eyes. We decided to keep the remaining eye in the vault. Now, even that has been stolen from us! Only the most trusted warriors may be involved in this [important Stormguard matter].");
		else
			e.self:Say(shifty);
		end
	elseif(e.message:findi("doran")) then
		if(e.other:GetFaction(e.self) < 6) then
			e.self:Say("Doran resides on an island in the Ocean of Tears. The island is filled with beautiful maidens. I could think of worse places to live.");
		else
			e.self:Say(shifty);
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local temphandins = 0;
	if((e.other:GetFaction(e.self) < 5) and (item_lib.check_turn_in(e.trade, {item1 = 13054, item2 = 13054, item3 = 13054, item4 = 13054}))) then -- Giant Rat Pelt
		e.self:Say("Great work, young one! We shall soon rid our mines of these pests. Keep a lookout for that [metal rat]. Here is a small reward for such fine work. Soon, you shall be know as Kaladim's resident exterminator.");
		e.other:Ding();
		e.other:Faction(314, 5); -- Storm Guard
		e.other:Faction(169, 1); -- Kazon Stormhammer
		e.other:Faction(219, 1); -- Miner's Guild 249
		e.other:Faction(215, 1); -- Merchants of Kaladim
		e.other:Faction(57, -1); -- Craknek Warriors
		e.other:AddEXP(500);
		e.other:GiveCash(0,3,0,0);
		e.other:Ding();
	elseif((e.other:GetFaction(e.self) < 5) and (item_lib.check_turn_in(e.trade, {item1 = 13282}))) then -- Scrap Metal
		e.self:Say("I thank you, my friend. I was to destroy this metal monster months ago. I could never find him. Please accept this reward for such good service. Oh yes.. And take this card to a man named [Doran Vargnus]. He is a fine blacksmith. I am sure he will reward you with one of his finest suits of armor. Perhaps you may now assist in an [important Stormguard matter].");
		e.other:SummonItem(13995); -- Knight (Card)
		e.other:Faction(314, 20); -- Storm Guard
		e.other:Faction(169, 5); -- Kazon Stormhammer
		e.other:Faction(219, 3); -- Miner's Guild 249
		e.other:Faction(215, 5); -- Merchants of Kaladim
		e.other:Faction(57, -5); -- Craknek Warriors
		e.other:AddEXP(500);
		e.other:GiveCash(4, 0, 0, 0);
		e.other:Ding();
	elseif((e.other:GetFaction(e.self) < 5) and (item_lib.check_turn_in(e.trade, {item1 = 13321}))) then -- Eye of Stormhammer
		--Quest text, exp, cash, factions made up
		e.self:Say("You've found it! I'm glad you managed to hunt down and return the stolen eye for us, " .. e.other:GetName() .. ". Such effort requires a similar reward so take this and use it well.");
		e.other:SummonItem(5415); -- Avenger Battle Axe
		e.other:Faction(314, 20); -- Storm Guard
		e.other:Faction(169, 5); -- Kazon Stormhammer
		e.other:Faction(219, 3); -- Miner's Guild 249
		e.other:Faction(215, 5); -- Merchants of Kaladim
		e.other:Faction(57, -5); -- Craknek Warriors
		e.other:AddEXP(5000);
		e.other:GiveCash(4, 0, 0, 0);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
