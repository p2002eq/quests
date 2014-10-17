-- quest for sarnak faction (give salts or gobling skins)
-- quest for Di'zok Signet of Service
-- which is the beginning of Regal Band of Bathezid
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail to you, lesser being! It is good to see you seeking the enlightenment and satisfaction that can only come from serving the Sarnak! Experience for yourself the joy of fealty to our Lord the Overking Bathezid Di'zok! I am Telcha, lesser apprentice sub-herald in training to the Court of Di'zok and I stand ready to welcome those who would serve our noble Overking. Are you here to [aid] us?");
	elseif(e.message:findi("aid")) then
		e.self:Say("Ah, so good of you to strive to improve yourself! So often members of your pathetic lesser races plod along in ignorance, unaware of the most Noble empire of the Di'zok. Enough though of the chit-chat, as I'm sure you are most eager to make yourself useful! Before you may enter our worthy city and be looked upon as a valuable servant, you must prove your worth to our [cause].");
	elseif(e.message:findi("cause")) then
		e.self:Say("The first task I shall set you is the slaying of goblins! Ooh, how very heroic you must feel to finally have a worthy goal guiding your previously menial existance! Yes, go forth from here and journey to Droga, stronghold of our enemies. Slay the warriors and menials of the Mountain Death Clan, bring havoc to their homes. Return to me with proof of your deeds, to raise in your standing with the Dizok. Bring me [tokens] of many dead goblins, and one day you shall walk among us.");
	elseif(e.message:findi("token")) then
		e.self:Say("As proof of your deeds I shall require either 2 Mountain Death mineral salts, or a patch of green goblin skin. Bring me many of these, as you bring destruction on the goblin city, and I shall speak to my superiors of your efforts on our behalf. Do enough for our cause, and I shall reward you directly. Return to me later and remind me that you serve the Sarnak, and I may have a ring for you if you are worthy.");
	elseif(e.message:findi("serve the sarnak")) then
		if(e.other:GetFaction(e.self) > 3) then -- amiably or lower
			e.self:Say("Away with you! I am the herald of the Dizok Overking, here to greet the servants of my master. If you would walk within our city, go forth and prove yourself our ally by slaying our goblin enemies! Advance into our city at your own peril, as our soldiers regard you as a foe!");
		elseif(e.other:GetFaction(e.self) == 3) then -- Kindly
			e.self:Say("You have not yet done enough service for the Sarnak Collective, and my Dizok Masters. Return to me when you have done more, and I may reward you with a ring of service.");
		elseif((e.other:GetFaction(e.self) < 3) and (e.other:GetLevel() < 50)) then -- Warmly and lvl<50
			e.self:Say("What to do, what to do.. You've served the Di'zok well, young one but you are not yet experienced enough to wear the Signet of the Di'zok. Come back when you've seen a bit more of the world, and the ring shall be yours.");
		elseif((e.other:GetFaction(e.self) < 3) and (e.other:GetLevel()> 49)) then -- Warmly and lvl>50
			e.self:Say("Indeed you do my friend, indeed you do! Walk among us in safety, wear this ring as a symbol of your service to our cause. Continue your efforts in our war on the goblins, and your rewards shall increase. Return to me your ring, along with the head of the Drogan Warlord Skargus, and I'll give you an even greater badge of honor. Good day to you, servant of the Sarnak.");
			e.other:SummonItem(5728); -- Di'zok Signet of Service
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 16972, item2 = 16972})) then --  Mt. Death Mineral Salts
		e.self:Say("Ah, most excellent! You are sure to be more highly valued as our servant once I speak to my masters of this! Mountain Death Mineral Salts, they shall grace the Overkings table this very night! Be off, minion! Fetch us some more salts to prove your value!");
		e.other:Faction(23,10);
		e.other:Faction(384,-30);
		e.other:QuestReward(e.self,0,0,0,0,0,8000);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 22135})) then -- Green Goblin Skin
		e.self:Say("Green Goblin Skin! You have indeed been busy! I shall speak to my masters of this, continue your good work and return to me with more skins.");
		e.other:Faction(23,10);
		e.other:Faction(384,-30);
		e.other:QuestReward(e.self,0,0,0,0,0,8000);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 6476, item2 = 5728})) then -- Head of Skargus & Di'Zok Signet of Service
		e.self:Say("Ah hah! You are notworthy indeed amongst the servants of the Sarnak! Perhaps I should have you killed, before your deeds outdo mine.. Hmm..");
		e.self:Say("Guards! Guards! Haha, do not panic menial being, in fact I am most impressed with your service. Here is the ring I promised you in exchange for your efforts.");
		e.other:Faction(23,50);
		e.other:Faction(384,-30);
		eq.delete_global("RegalBandBathezid");
		e.other:QuestReward(e.self,0,0,0,0,5727,50000); -- 5727  Regal Band of Bathezid
	end
	if((e.other:GetFaction(e.self)==1) and item_lib.check_turn_in(e.trade, {item1 = 5727, item2 = 5728})) then -- Regal band of Bathezid
		e.other:QuestReward(e.self,0,0,0,0,5727); -- 5727  Regal Band of Bathezid
	end

	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
