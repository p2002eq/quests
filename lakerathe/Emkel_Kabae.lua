-- Necromancer Epic NPC -- Emkel_Kabae

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I am Emkel Kabae, first apprentice to Kazen. If you have a symbol, tell me its name.");
	elseif(e.message:findi("symbol of the serpent")) then
		e.self:Say("There are more reagents to be gathered. The time draws near for our master's ascension. Travel to the lands of Kunark and seek out Ssessthrass. He is a very wise Iksar herbalist helping me in my endeavor to please Master Kazen. Be careful not to insult his speech, or you may end up dead before you serve your purpose to the master. Be sure to show him the symbol as proof or he may consider you dinner.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 20643, item2 = 20649})) then
		e.self:Emote("says, 'Very good, " .. e.other:GetName() .. ", you have done as the master asked yet again, take this as a reward.' Emkel reaches into his robes and pulls out a small symbol. He holds it out and the tiny symbol floats to your hand.");
		e.other:AddEXP(500);
		e.other:SummonItem(20644);
		e.other:Ding();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20650, item2 = 20649})) then
		e.self:Say("'You are truly worthy of studying with our master. Bear this new symbol and contemplate what you wish from life before you let go of it. Ask the master about the symbol of testing and he will explain all. I too was tested by him.' Emkel pulls up his sleeve to show a grievous scar from his wrist to his shoulder.");
		e.other:AddEXP(1000);
		e.other:SummonItem(20647);
		e.self:Say("You must ask the master about the symbol of testing. Do not hand the symbol to him for he may interpret that as a breach of conduct.");
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- Quest by: Solid11  Zone:lakerathe  ID:51047 -- Emkel_Kabae
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
