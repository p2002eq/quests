function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello. It is dangerous out in the woods. You should go to Rivervale. It's at the end of the path. You will find good times there. Travel safely, my friend!");
	elseif(e.message:findi("shard")) then
		e.self:Say("Searching for that blasted emerald shard, are you? That thing has done nothing but bring me bad luck!! I would gladly give it to you if you would do a [small favor] for me.");
	elseif(e.message:findi("small favor")) then
		if(e.other:GetFaction(e.self) < 5) then
			e.self:Say("I have been tracked here by a bounty hunter named Slaythe. I have heard reports of his presence beyond the Great Wall. Please seek him out and bring me some body part of his as proof of his passing. Do this and the emerald shard is yours.");
			if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(33146) == false) then
				eq.spawn2(33146, 0, 0, 893.00, 664.00, -34.73, 0); -- Spawn Slaythe
			end
		elseif(e.other:GetFaction(e.self) < 6) then
			e.self:Say("When the blood of many Runnyeye goblins has covered your blade, then I shall find you worthy to speak of such matters.");
		else
			e.self:Say("You are no ally of the Rivervale Deeppockets!! Leave at once!!");
		end
	elseif(e.message:findi("second piece of the gem")) then
		if(e.other:GetFaction(e.self) < 5) then
			e.self:Say("The second emerald shard was hidden in the forest near Kelethin. I heard one of the local guilds found it and now call it the Gem of Tunare. You will have to ask around in Kelethin about it. Good luck.");
		elseif(e.other:GetFaction(e.self) < 6) then
			e.self:Say("When the blood of many Runnyeye goblins has covered your blade, then I shall find you worthy to speak of such matters.");
		else
			e.self:Say("You are no ally of the Rivervale Deeppockets!! Leave at once!!");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 13110})) then -- Bloody Shank
		e.self:Say("AHH!! You have been sent by the Highkeep Guards!! You will never take Bronin Higginsbot alive!!");
		e.other:Faction(77, -25); -- Deeppockets
		e.other:Faction(33, -25); -- Circle Of Unseen Hands
		e.other:Faction(218, 25); -- Merchants of Rivervale
		e.other:Faction(48, -25); -- Coalition of Tradefolk Underground
		e.other:Faction(31, -25); -- Carson McCabe
		eq.attack(" .. e.other:GetName() .. ");
	end
	if((e.other:GetFaction(e.self) < 5) and (item_lib.check_turn_in(e.trade, {item1 = 12192}))) then -- Froglok Leg
		e.self:Say("So I see you have defeated Slaythe. I shall sleep much better now that he is gone. I placed the emerald shard in one of the Highkeep strongboxes in Highpass. Give the bank clerk's assistant, Kiolna this key. There is a [second piece of the gem] which I hid near Kelethin. You will need it to complete the gem. I hope it brings you better luck than I.");
		e.other:Faction(77, 10);   -- Deeppockets
		e.other:Faction(33, 10);   -- Circle Of Unseen Hands
		e.other:Faction(218, -10); -- Merchants of Rivervale
		e.other:Faction(48, 10);   -- Coalition of Tradefolk Underground
		e.other:Faction(31, 10);   -- Carson McCabe
		e.other:AddEXP(500);
		e.other:SummonItem(12193); -- H.K. 106
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
