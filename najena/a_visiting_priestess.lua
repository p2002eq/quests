-- Quest for The Visiting Priestess

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetName() .. "! Are you the champion Najena sent for?");
	elseif(e.message:findi("champion of Najena")) then
		e.self:Say("Very well champion.  Have you heard of The Staff of Ankexfen?"); -- Not real text
	elseif(e.message:findi("not heard of the staff")) then
		e.self:Say("No? Why am I not surprised? You look too weak and frail to be of any use. You probably could not even best one of those intoxicated, weak-minded goblins controlled by that pathetic eye called Xxorb. Away with you, useless creature!");
	elseif(e.message:findi("happened to the Ankexfen")) then
		e.self:Say("The wrath of the unnamed gods was grim. Thousands of ogres were instantly slain - their empire left to crumble under the hand of retribution. The giants were flung across the face of Norrath like seeds to the wind. The Ankexfen's fates were more severe. The entire race was exterminated, but from the ashes were born the four goblin races. What is known is that each goblin clan was stripped of any knowledge and was neither informed of the other clans nor of their own origins. Each clan was then transported to a separate environment to help preserve the gods' will. However, the gods were not without mercy and each clan was granted a section of the staff. Upon each staff, a crystal was placed. These staves served to aid the goblin clans in understanding their environments. These remnants of the staff of Ankexfen are what I desire. Bring them to me and the Priests of Innoruuk shall reward you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if (e.other:GetFaction(e.self) <= 5) then -- indifferent or better priests of innoruuk
		if(item_lib.check_turn_in(e.trade, {item1 = 6323,item2 = 6324,item3 = 6335,item4 = 6336})) then
			e.self:Emote("cackles with glee as she slowly assembles the runed rods, and with a muttered incantation and a flash of light, disappears, leaving only a note that slowly drifts to the ground.");
			e.other:Faction(256, 20); -- Priests of Innoruuk
			e.other:Faction(177, 1); -- King Naythox Thex
			e.other:Faction(258, -3); -- Priests of Marr
			e.other:Faction(43, -2); -- Clerics of Tunare
			e.other:Faction(257, -1); -- Priests of Life
			e.other:Faction(260, -40); -- Primordial Malice
			e.other:QuestReward(e.self,0,0,0,0,18401,132775); --  Scroll of Flayed Goblin Skin --  2.5% @ level 30
			eq.depop_with_timer();
		else
			item_lib.return_items(e.self, e.other, e.trade,false);
			e.self:Emote("grins evilly as she disassembles the staff and holds forth a runed wooden rod.");
		end
	end
	item_lib.return_items(e.self, e.other, e.trade,false);
end

-- END of FILE Zone:najena ID:44107 -- a_visiting_priestess 