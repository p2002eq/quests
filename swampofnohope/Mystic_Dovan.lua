--Shaman Skull Quest 4
--Shaman Skull Quest 5
--Cures - Apparently on live this guy does some neat emotes when curing or healing you.  When I can find a log, I'll add them.  In the meantime, might be nice for the newbies
--to be able to use his healing/curing quest even without the proper responses. -Kilelen
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("shows the signs of a great mystic. You can feel the power resonating from his aura. 'Greetings and may the cursed blessings of Cazic-Thule be yours. What may I do for you this fine evening? Perhaps I can [cure disease] or [heal] you, perhaps even [purge toxins] from your system?");
	elseif(e.message:findi("cure disease")) then
		e.self:Say("Your malady shall dissipate once you deliver to me one giant blood sac.");
	elseif(e.message:findi("heal")) then
		e.self:Say("I can call upon the power of the ancients to mend your wounds if you can deliver to me two brittle Iksar skulls.");
	elseif(e.message:findi("purge toxins")) then
		e.self:Say("The toxins shall surely be purged from your system when I have proof of your allegiance to the empire. Let that proof be one goblin watcher signal torch.");
	elseif(e.message:findi("I come to inquire about the Crusaders of Rok Nikol") and e.other:GetFaction(e.self) < 6 and tonumber(qglobals.shmskullquest) > 5) then
		e.self:Say("Mystic Dovan lowers his head in sorrow let us have a moment of peace. I cannot find the words to speak of the unspeakable act of the gods which took the lives of the legendary Crusaders of Rok Nolok. You must find the answers for yourself. All I can do is wait for their return. ");
	elseif(e.message:findi("Who is Galdon Vok Nir?") and e.other:GetFaction(e.self) < 8 and tonumber(qglobals.shmskullquest) > 5) then
		e.self:Say("He is a merchant hiding in The Overthere. He is greedy and will not give the skull up easily. Seek him out and ask him what he would [trade] for the skull.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	--Full C.O.R.N. Chest turn in and Cudgel of the Mystic
	if(item_lib.check_turn_in(e.trade, {item1 = 12736, item2 = 5143}) and e.other:GetFaction(e.self) < 6 and shmskullquest > 5) then
		e.self:Say("I see that you have found your answers. Now I must ask you to to retrieve for the council the skulls of the Di Nozok.  The sarnak in Lake of Ill Omen hold one of the skulls, while [Galdon Vok Nir] holds the other. Once you have retrieved them, give them to Hierphant Zand.");
		e.other:Faction(282, 10); --Scaled Mystics
		e.other:Faction(193, 10); --Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,0,5144,100000); --Give the player the Iron Cudgel of the Prophet
		eq.set_global("shmskullquest","7",5,"F"); --set a global flag so that user can do shm skull quest part 5
	end
	--Cure disease.
	if(item_lib.check_turn_in(e.trade, {item1 = 12671})) then--giant blood sac
		e.self:Say("Day destroys the night, night divides the day. Tried to run, tried to hide, break on through to the other side.");--Obviously borrowed.
		e.self:CastSpell(userid, 213);
		e.other:Faction(282, 10); --Scaled Mystics
		e.other:Faction(193, 10); --Legion of Cabilis
	end
	--Heal (Light Healing)
	if(item_lib.check_turn_in(e.trade, {item1 = 12739, item2 = 12739})) then--2x Brittle Iksar Skull
		e.self:Emote("Destruction leads to a very rough road, but it also breeds creation.");--Obviouslyborrowed.
		e.self:CastSpell(userid, 17);
		e.other:Faction(282, 10); --Scaled Mystics
		e.other:Faction(193, 10); --Legion of Cabilis
	end
	--Cure Poison
	if(item_lib.check_turn_in(e.trade, {item1 = 12441})) then--Watcher Signal Torch
		e.self:Emote("All the money you make will never buy back your soul.");--Obviously borrowed.
		e.self:CastSpell(userid, 203);
		e.other:Faction(282, 10); --Scaled Mystics
		e.other:Faction(193, 10); --Legion of Cabilis
	end
	item_lib.return_items(e.self, e.other, e.trade) --return items if not the ones required
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
