function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFaction(e.self) < 8) then
			e.self:Say("How is life treating you, bud? What are you doing around the mines? Either you are a [member of 628] or you are lost. If you are lost, I can't help you. I ain't no guide.");
		else
			e.self:Say("The word around the mines is that you are not to be trusted. You'd best leave before my dagger finds a new home in your back.");
		end
	elseif(e.message:findi("628")) then
		if(e.other:GetFaction(e.self) < 5) then
			e.self:Say("It's my duty to assign [guild tasks] to all new members of Mining Guild 628.");
		end
		if(e.other:GetFaction(e.self) < 6) then
			e.self:Say("Don't take this personally, but I can't quite trust you with such matters. Maybe a few less Butcherblock bandits would prove your worth");
		else
			e.self:Say("The word around the mines is that you are not to be trusted. You'd best leave before my dagger finds a new home in your back.");
		end
	elseif(e.message:findi("tasks")) then
		if(e.other:GetFaction(e.self) < 5) then
			e.self:Say("I see you are interested in helping out. Good! For starters, go into the surrounding territory of Kaladim and destroy all the goblins. We hear they sometimes carry necklaces of ornate design. 628 wants these Runnyeye warbeads. You bring me no fewer than four and I will pay you and maybe, just maybe, I may have an extra piercing weapon lying around which has your name on it.");
		end
		if(e.other:GetFaction(e.self) < 6) then
			e.self:Say("Don't take this personally, but I can't quite trust you with such matters. Maybe a few less Butcherblock bandits would prove your worth.");
		else
			e.self:Say("The word around the mines is that you are not to be trusted. You'd best leave before my dagger finds a new home in your back.");
		end
	elseif(e.message:findi("pick")) then
		if(e.other:GetFaction(e.self) < 5) then -- Requires high amiable on live
			e.self:Say("So you want to earn a parrying pick? Consider it an honor that I am even speaking of this with you. The guild had these picks made just for us. It is a magic item used to fend off attacks. Before you can have one, you will have to do me a [great favor].");
		end
		if(e.other:GetFaction(e.self) < 6) then
			e.self:Say("Don't take this personally, but I can't quite trust you with such matters. Maybe a few less Butcherblock bandits would prove your worth.");
		else
			e.self:Say("The word around the mines is that you are not to be trusted. You'd best leave before my dagger finds a new home in your back.");
		end
	elseif(e.message:findi("great favor")) then
		if(e.other:GetFaction(e.self) < 5) then -- Requires high amiable on live
			e.self:Say("Mater has asked me to exterminate the dwarven family of Dunfire. They were once members of our guild. They left and now use their talents to aid the Butcherblock bandits. We will not allow them to speak of the skills we taught them. Go and rip out their tongues. Return the tongues of Crytil, Rondo, Keldyn, and Barma Dunfire and the parrying pick is yours.");
		end
		if(e.other:GetFaction(e.self) < 6) then
			e.self:Say("Don't take this personally, but I can't quite trust you with such matters. Maybe a few less Butcherblock bandits would prove your worth.");
		else
			e.self:Say("The word around the mines is that you are not to be trusted. You'd best leave before my dagger finds a new home in your back.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 13931, item2 = 13931, item3 = 13931, item4 = 13931})) then -- RunnyEye Warbeads
		e.self:Say("Good work. We shall add these to the stash. Here is your reward, as promised. Be happy with it and continue your work. Maybe soon you shall be able to [earn a parrying pick].");
		e.other:SummonItem(eq.ChooseRandom(7007,7008,7009,7010));
		e.other:Faction(220, 10); -- Miners Guild 628
		e.other:Faction(33, -10); -- Circle Of Unseen Hands
		e.other:Faction(29, -10); -- Butcherblock Bandits
		e.other:Faction(77, 10);  -- Deeppockets
		e.other:Faction(90, -10); -- Ebon Mask
		e.other:AddEXP(5000);
		e.other:GiveCash(0, 4, 0, 0);
		e.other:Ding();
	elseif((e.other:GetFaction(e.self) < 5) and (item_lib.check_turn_in(e.trade, {item1 = 12170, item2 = 12172, item3 = 12174, item4 = 12178}))) then -- Dunfire Tongues
		e.self:Say("Excellent work!! You are quite an asset to this mining guild. Please accept this Parrying Pick 628 for your great service. If you truly wish to serve our guild. Go and speak with Mater. Tell him you are [ready to earn Mining Pick 628].");
		e.other:SummonItem(12166); -- Parrying Pick 628
		e.other:Faction(220, 10); -- Miners Guild 628
		e.other:Faction(33, -10); -- Circle Of Unseen Hands
		e.other:Faction(29, -10); -- Butcherblock Bandits
		e.other:Faction(77, 10);  -- Deeppockets
		e.other:Faction(90, -10); -- Ebon Mask
		e.other:AddEXP(5000);
		e.other:Ding();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 9813})) then -- Rogue Epic 1.5 handin
		e.self:Say("Fine job, " .. e.other:GetName() .. ". I knew ye had the burning fire of a smith ragin' inside ye. These little relics are going on my mantle, or I may sell em. Not sure yet.' He sets the items aside, 'Now, sit fer a spell and allow me to tell ye what you need to know. It should go without sayin', " .. e.other:GetName() .. ", that a fine blade is crafted with the best metals possible. Any fool knows that. What ye don't know is that the lightest and sturdiest stuff to be found is an alloy called Velixite. With a few pounds of raw Velixite you could truly forge a blade to be feared. Give me jes' a moment while I take down some notes in your journal, " .. e.other:GetName() .. ". There ye are, all done!");
		e.self:Emote("You have coerced Diggins into revealing his secret. ");
		--Add global
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
