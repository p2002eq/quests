function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote('shows no reaction to your greeting.');
		eq.signal(106097,1);
	elseif(e.message:findi("trial of agility")) then
		e.self:Say('I knew you were not the whiff others claimed you to be, are you sure you are [ready] to be tested in agility?');
	elseif(e.message:findi("ready")) then
		e.self:Say('We shall spar then, I hope you are as prepared as you think you are.');
		e.self:CastSpell(2064,e.other:GetID(),0,1);
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18204})) then -- Guild Summons
		e.self:Emote('breaks his meditation and quickly grabs your forearms. You feel the raw power in his heavily callused hands. Out of nowhere, his tail sweeps forward and places a shackle upon your wrist. He then points south towards Master Bain and returns to his meditation.');
		e.other:SummonItem(4190); 	-- Shackle of Dust
		e.other:Faction(317,200); 	--Swift Tails
		e.other:Faction(193,50); 	--Legion of Cabilis
		e.other:AddEXP(100);
		e.other:Ding();
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 14788})) then
		e.self:Emote("sits whispering incoherently for a long moment before even regarding the note you dropped in front of him. The Grand Master suddenly snatches up the note from Xlixinar, removes a small charcoal marker from a belt pouch, and scrawls some intructions upon it. He drops the note immediately after finishing and resumes his meditation without a word.");
		e.other:SummonItem(18980);
		e.other:Ding();
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 14782, item2 = 10032})) then
		e.self:Emote("nods slightly");
		e.other:SummonItem(14783);
		e.other:AddEXP(10000);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
