-- Shaman Skull Quest 4 & 5
function event_say(e)
	local qglobals = eq.get_qglobals(e.self,e.other);
	if(e.message:findi("Hail")) then
		e.self:Emote("shows the signs of a great mystic. You can feel the power resonating from his aura. 'Greetings and may the cursed blessings of Cazic-Thule be yours. What may I do for you this fine evening? Perhaps I can [" .. eq.say_link("cure disease") .. "] or [" .. eq.say_link("heal") .. "] you, perhaps even [" .. eq.say_link("purge toxins") .. "] from your system?");
	elseif(e.message:findi("cure disease")) then
		e.self:Say("Your malady shall dissipate once you deliver to me one giant blood sac.");
	elseif(e.message:findi("heal")) then
		e.self:Say("I can call upon the power of the ancients to mend your wounds if you can deliver to me two brittle Iksar skulls.");
	elseif(e.message:findi("purge toxins")) then
		e.self:Say("The toxins shall surely be purged from your system when I have proof of your allegiance to the empire. Let that proof be one goblin watcher signal torch.");
	elseif(e.message:findi("Rok Nilok") and (e.other:GetCharacterFactionLevel(282) > 6) and (tonumber(qglobals.shmskullquest) >= 5)) then
		e.self:Emote("lowers his head in sorrow. 'let us have a moment of peace. I cannot find the words to describe the unspeakable act of the gods which took the lives of the legendary Crusaders of Rok Nilok. You must find the answers for yourself. All I can do is await their return.'");
	end
end

function event_trade(e)
	local qglobals = eq.get_qglobals(e.self,e.other);
	local item_lib = require("items");
	if((tonumber(qglobals.shmskullquest) >= 5) and (item_lib.check_turn_in(e.self, e.trade, {item1 = 12736, item2 = 5143})) and e.other:GetFaction(e.self)) then -- Full C.O.R.N. Chest and Iron Cudgel of the Mystic
		e.self:Emote("'s voice booms loudly and does not sound the same as before. 'You have brought the skulls back to the empire. For this you shall be rewarded. You are now a prophet of the Temple of Terror. Go and find the Skulls of Di Nozok. I shall wait within Zand. Bring them along with your iron cudgel of the prophet.'");
		e.other:Faction(282, 10); --Scaled Mystics
		e.other:Faction(193, 10); --Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,0,5144,100000); -- Iron Cudgel of the Prophet
		eq.set_global("shmskullquest","6",5,"F"); -- Completed Cudgel Quest 4
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12671})) then -- A Giant Blood Sac
		e.self:Say("Day destroys the night, night divides the day. Tried to run, tried to hide, break on through to the other side."); -- Obviously borrowed.
		e.self:CastSpell(213,e.other:GetID()); -- Cure Disease
		e.other:Faction(282, 1); -- Scaled Mystics
		e.other:Faction(193, 1); -- Legion of Cabilis
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12739, item2 = 12739})) then -- 2x Brittle Iksar Skull
		e.self:Emote("Destruction leads to a very rough road, but it also breeds creation.");-- Obviously Borrowed.
		e.self:CastSpell(17,e.other:GetID()); -- Light Healing
		e.other:Faction(282, 1); -- Scaled Mystics
		e.other:Faction(193, 1); -- Legion of Cabilis
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12441})) then -- Watcher Signal Torch
		e.self:Emote("All the money you make will never buy back your soul."); -- Obviously borrowed.
		e.self:CastSpell(203,e.other:GetID()); -- Cure Poison
		e.other:Faction(282, 1); -- Scaled Mystics
		e.other:Faction(193, 1); -- Legion of Cabilis
	end
	item_lib.return_items(e.self, e.other, e.trade)
end