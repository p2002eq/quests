function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to intelligence, young " .. e.other:GetName() .. "! Did you think all ogres were inept? Ha!! I hope you show the glimmer. We shamans need more within our ranks. Our race needs to evolve!! So, are you one of the smart ogres or have I spoken too many syllables?");
	elseif(e.message:findi("smart ogre")) then
		e.self:Say("Well, I suppose your intelligence shall grow. You will have to do. I have a mission for you. First, go and speak with Grevak of the Greenblood Knights. He will have a job for you. After you have performed some manner of service and advanced at least 5 ranks, return to me and ask me about my secret mission.");
	elseif(e.message:findi("secret mission")) then
		e.self:Say("I have heard of your advancements. You are a fine addition to Oggok. I require your skill in handling a delicate matter. I want you to run out to the Bouncer's keep near the entrance to Oggok. There, you shall find a froglok named Glib. He will pose no threat to you. He has come on business and I have promised him protection. Tell him the Greenblood shaman sent you. He shall fill you in. Go at once.");
		eq.unique_spawn(49127,0,0,383,-205.3,66.1,0);
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 18884}) or item_lib.check_turn_in(e.trade, {item1 = 18886})) then
		e.self:Say("I see you finally decided to return. Hmmm. What is this? Those little hoppers have done well. What!! So the troll scum have been aiding our foes, the lizards!! The lizard mystics are trained by this troll shaman called Zimbittle. Find him!! Kill him. Bring me his shaman pouch!! Now!!");
		e.other:Faction(295,10);
		e.other:SummonItem(eq.ChooseRandom(15270,15226,15279,15211));
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18886})) then
		e.self:Say("I see you finally decided to return. Hmmm. What is this? this troll shaman called Zimbittle. Find him!! Kill him. Bring me his shaman pouch!! Now!! "); -- text made up.
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18885})) then
		e.self:Say("What is this? More information? There seems to be a larger plan in the making. B'Dynn sounds like a Dark Elf name. I do no like the sound of this.  You must go quickly to North Ro.  Find this Dark Elf.  Find out what he knows.  any way you can.");
		e.other:Faction(295,10);
		e.other:SummonItem(eq.ChooseRandom(15270,15226,15279,15211));
	elseif(item_lib.check_turn_in(e.trade, {item1 = 17929})) then
		e.self:Say("Ahhh!! Good work. You are a bright one. Now let us see if you can master this spell. Learn it well and may it bring you much glory.");
		e.other:Faction(295,10);
		e.other:SummonItem(eq.ChooseRandom(15270,15226,15279,15211));
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:oggok  ID:49038 -- Marda
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
