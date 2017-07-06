function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("turns to you and snorts in anger. Some mucus lands on your cheek.");
		e.self:Say("Troopers! I thought I ordered you to keep all new recruits away from this chamber! Go, child. The War Baron of Cabilis has no time for games. See this intruder out!!");
	elseif(e.message:findi("memory")) then
		e.self:Emote("takes a step back and thinks to himself. Phlegm dribbles off his lips.");
		e.self:Say("The Memory of Sebilis. Kept within my personal chambers. They have been taken. Taken by some croakin' Forsaken no doubt!! You have been sent to me because you show excellent prowess. Find my Memory and bring it to me with your footman's pike.");
	elseif(e.message:findi("trooper")) then
		e.self:Say("So you are a trooper? Word of your deeds has been spreading through the legion. If you truly wield the pike of a trooper, then go and serve the garrisons of swamp, lake and woods. Report to the Warlord and tell him you are a [trooper reporting for duty]. Their recommendations and your trooper pike shall earn you the rank of legionnaire.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18464, item2 = 22919})) then -- Dark Grey Tome and Sarnak Hide
		e.self:Emote("smiles at your dedication to Cazic Thule and hands you a small gem.");
		e.other:Faction(317,20); -- Swift Tails
		e.other:Faction(193,10); -- Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,0,7881,20000); -- Mark of Clarity
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18463, item2 = 22918})) then -- Light Black Tome and Chokadai Scale
		e.self:Emote("smiles at your dedication to Cazic Thule and hands you a small gem.");
		e.other:Faction(317,20); -- Swift Tails
		e.other:Faction(193,10); -- Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,0,7881,20000); -- Mark of Clarity
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12899, item2 = 12898, item3 = 12896, item4 = 5132})) then -- An Emerald, A Sapphire, A Ruby and Footmans Pike
		e.self:Emote("gulps down a wad of phlegm.");
		e.self:Say("My memory has returned! Boneripper! You are no footman. I grant you the rank of soldier. Go and forge your weapon. Do not return to me until you become a [brave trooper of the empire].");
		e.self:Say("Find Drill Master Kyg to help you in this task?  [Footman Moglok] needs help.");
		e.other:Faction(30,2); -- Cabilis Residents
		e.other:Faction(193,2); -- Legion of Cabilis
		e.other:Faction(282,2); -- Scaled Mystics
		e.other:Faction(317,2); -- Swift Tails
		e.other:Faction(62,2); -- Crusaders of Greenmist
		e.other:QuestReward(e.self,0,0,0,0,12476,800); -- Soldier Head Plans
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18073, item2 = 18072, item3 = 18074, item4 = 5134})) then -- Legionnaire Recommendation (Swamp Garrison), Legionnaire Recommendation (Woods Garrison), Legionnaire Recommendation (Lake Garrison) and Troopers Pike
		e.self:Emote("takes away your pike and hands you plans not for a pike head, but for the crown of another polearm.");
		e.self:Say("It is time to wield the weapon of a [true warrior of the legion]. You have done well, Legionnaire " .. e.other:GetName() .. "!");
		e.other:Faction(30,2); -- Cabilis Residents
		e.other:Faction(193,2); -- Legion of Cabilis
		e.other:Faction(282,2); -- Scaled Mystics
		e.other:Faction(317,2); -- Swift Tails
		e.other:Faction(62,2); -- Crusaders of Greenmist
		e.other:QuestReward(e.self,0,0,0,0,12478,4000); -- Legionnaire Crown Plans
	end
	item_lib.return_items(e.self, e.other, e.trade)
end