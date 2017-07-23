-- Newbie GM and Trooper Scale Armor
function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18204)) then -- Guild Summons
		e.other:Message(15,"As you enter the Court of Pain, Grand Master Glox, sits in mediation. Without even looking up, he addresses you. 'The time has come for discipline. Read the note in your inventory and then hand it to me to begin your training.'");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("shows no reaction to your greeting.");
		eq.signal(106097,1);
	elseif(e.message:findi("trial of agility")) then
		e.self:Say("I knew you were not the whiff others claimed you to be, are you sure you are [" .. eq.say_link("ready") .. "] to be tested in agility?");
	elseif(e.message:findi("ready")) then
		e.self:Say("We shall spar then, I hope you are as prepared as you think you are.");
		e.self:CastSpell(2064,e.other:GetID(),0,1);
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18204})) then -- Guild Summons
		e.self:Emote("breaks his meditation and quickly grabs your forearms. You feel the raw power in his heavily callused hands. Out of nowhere, his tail sweeps forward and places a shackle upon your wrist. He then points south towards Master Bain and returns to his meditation.");
		e.other:Faction(317,200); -- Swift Tails
		e.other:Faction(193,50); -- Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,0,4190,100); -- Shackle of Dust
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 14788})) then  -- Illegible Note: Helm
		e.self:Emote("sits whispering incoherently for a long moment before even regarding the note you dropped in front of him. The Grand Master suddenly snatches up the note from Xlixinar, removes a small charcoal marker from a belt pouch, and scrawls some intructions upon it. He drops the note immediately after finishing and resumes his meditation without a word.");
		e.other:QuestReward(e.self,0,0,0,0,18980,100); -- Note from Glox
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 14782, item2 = 10032, item3 = 10032})) then -- a Tiny Collar and 2x Star Ruby
		e.self:Emote("nods slightly");
		e.other:QuestReward(e.self,0,0,0,0,14783,1000); -- Glox Reference
	end
	item_lib.return_items(e.self, e.other, e.trade)
end