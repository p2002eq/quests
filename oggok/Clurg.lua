function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, friend. Have a drink. I have some [unique drinks]. Try one. And remember. You get rowdy, the [Bouncers] crush you.");
	elseif(e.message:findi("bouncers")) then
		e.self:Say("The Bouncers were organized by me. As I traveled to many of the world's taverns I encountered great enforcers called bouncers. It was their duty to keep order amongst chaos. When I returned and rose to greatness after the creation of the [Flaming Clurg]. I organized the Oggok Bouncers to keep order amongst the [rival guilds].");
	elseif(e.message:findi("flaming clurg")) then
		e.self:Say("The Flaming Clurg was my greatest creation. It brought me great respect in Oggok. Unfortunately, I have heard tales of an [imposter drink].");
	elseif(e.message:findi("imposter drink")) then
		e.self:Say("Bah! Dat damned Pungla! She be imitatin me drinks! I want som'on to [deal] with dat damned witch! If som'on wud jus bring me her head, I wud pay em!");
		e.self:Say("Find ways to help all in Oggok. Then we will have conversation.");
	elseif(e.message:findi("rival guilds")) then
		e.self:Say("Oggok has been the battleground for the feud between the Greenblood knights and shamans and the Craknek warriors. It is fueled by the superior intellect of the Greenbloods. Few remember that I, Clurg, was once dim, but now I speak with great words.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13379})) then
		e.self:Say("Ahhh!! My Barkeep Compendium has been returned!! I am in your debt. I do not like to be in any man's debt. Let me offer you this as payment for your great service. Obtaining my book could not have been a simple task.");
		e.other:Faction(46,10);   --Clurg
		e.other:Faction(169,-10); --Kazon Stormhammer
		e.other:Faction(128,10);  --Green Blood Knights
		e.other:Faction(57,10);   --Craknek Warriors
		e.other:Faction(232,10);  --Oggok Guards
		e.other:QuestReward(e.self,0,0,0,0,13380,500);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13378})) then
		e.self:Say("Haha! He shall mix no more Flaming Pungla's! I shall drink from his rotting skull tonight. As for you, take this and call it yours. Consider yourself a friend of Clurg.");
		e.other:Faction(46,10);   --Clurg
		e.other:Faction(169,-10); --Kazon Stormhammer
		e.other:Faction(128,10);  --Green Blood Knights
		e.other:Faction(57,10);   --Craknek Warriors
		e.other:Faction(232,10);  --Oggok Guards
		e.other:QuestReward(e.self,0,0,1,5,eq.ChooseRandom(10021,10024,6302,13355,6006),500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------