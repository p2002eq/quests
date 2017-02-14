---- Darkened Jawbones
local count = 0;
function event_spawn(e)
	eq.set_timer("karina",90000);
end

function event_timer(e)
	count = count + 1;
	if(count == 1) then
		e.self:Say("When our companions are wounded, we must call to the spirits and ask for their aid. Kindred spirits are able to protect us and heal our wounds.");
	elseif(count == 2) then
		e.self:Say("Never force a spirit to your aid. You will find that there are many that will come to your side. You need only ask.");
	elseif(count == 3) then
		e.self:Say("Only use your connection to the spiritual realm when you need it. Do not drain yourself unnecessarily, for you will find yourself unable to call for aid when you need it the most. Ration out your spiritual strength carefully, it will be vital to your own survival.");
	elseif(count == 4) then
		e.self:Say("Try not to become the focus of attention in a battle. You will find it much more efficient to strike when the opponent is distracted. Do not hestitate to ask others to join you. You will find that many welcome your ability to cure battle wounds and call forth protection from the spirits around you.");
	elseif(count == 5) then
		e.self:Say("Be sure to maintian your material components. You will need these to perform the necessary rituals to call on the power of many spirits.");
	elseif(count == 6) then
		e.self:Say("Never lead an enemy to your allies. It is considered the greatest dishonor to do so. Remember that you will carry the name you make for yourself in youth all the way to your elder years. Your actions now will determine the outcome of your future.");
	elseif(count == 7) then
		e.self:Say("Try not to waste the hides of the beasts you hunt. It is wise to craft these hides into armor for yourself.");
	elseif(count == 8) then
		e.self:Say("Always pay attention to your surroundings. There are many opponents that will ambush you while you are out in the field. It is wise to take companions with you when venturing far.");
	elseif(count == 9) then
		e.self:Say("Visit your trainer to master new skills as soon as you are able. The longer you tarry about, the harder it will be for you to learn your skill later on. The more you use the skills you learn, the better you will become at using them.");
		count = 0;
		eq.set_timer("karina",90000);
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome, friend. Come dance by our warm fire or have a seat and [learn] a little bit about the ways of the spiritist.");
	elseif(e.message:findi("learn")) then
		e.self:Say("We are those in tune with the spirits that surround us. Ancestral spirits with knowledge of the ancients dance around us by this very fire. They guide is through the darkness. Protect us from pain. But a terrible [curse] has befallen the spirits of this thicket, and so it is my duty to train these young Dar Khura in order to aid in the battle that lies ahead.");
	elseif(e.message:findi("curse")) then
		e.self:Say("The spirits are corrupted by foul magic. The souls of our ancestors have been twisted into an abomination known as [shades]. The corpses of long passed friends and relatives walk through the night seeking to destroy the living. We must destroy the corrupted remains of their old bodies and allow the spirits to roam free once more. Will you help us [release the souls] of our kindred spirits?");
	elseif(e.message:findi("shades")) then
		e.self:Say("The shades are a deeper form of corruption of the spirit. I can sense great anguish in the spirits that have been twisted into such a creation. Their horror burns my heart so deeply that I cannot bear it. I would not normally ask another to place themselves in danger, but it is important that the souls are released from these shadowed prisons of torture and darkness. Please help us [release the souls] of our ancestral spirits.");
	elseif(e.message:findi("release the souls")) then
		e.self:Say("I am relieved that you have accepted this dangerous task. I can feel the strength of the spirit within you. There are many kindred spirits aiding us in this battle. If you are in tune with the spiritual realm, you will find that your rituals of magic will result in aid from our spiritual allies. Return to me with the [darkened jawbones] of the lesser shades so that I may release the spirit once more.");
	elseif(e.message:findi("darkened jawbones")) then
		e.self:Say("The jawbones will aid me in tuning to the essence of the corrupted spirits. When you return to me with them, you are enabling me to place the lost soul to rest. I am able to release four of these spirits at one time in much the same way I am training these four young trainees. It is best to bring me four of them at one time if you are able.");
		e.self:Say("Always pay attention to your surroundings. There are many opponents that will ambush you while you are out in the field. It is wise to take companions with you when venturing far.");
	elseif(e.message:findi("loda kai")) then
		e.self:Say("Loda Kai left Shar Vahl many years ago. He had set off for the distant city of Katta Castellum just north of the tenebrous mountains. We have not seen him since, but the brigands wear his family emblem. [Kedra Kai] has banished himself from our city in shame.");
	elseif(e.message:findi("Kedra Kai")) then
		e.self:Say("He stands vigil at the crossroads of the trading routes. Kedra has sworn to destroy the brigands and his brother before returning to Shar Vahl. There are many skeletal brigands within the thicket. If you are able to acquire their rotting jawbones, please bring them to me. I will try to learn what I can from the magic within them.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30872, item2 = 30872, item3 = 30872, item4 = 30872})) then -- 4x A Darkened Jawbone
		e.self:Say("I can see that you have a brave heart. You have rescued many of the fallen spirits with little regard to your own welfare. Such selfless acts should not go unrewarded. Please take these gloves and wear them with pride. It is a symbol of [rebirth].");
		e.other:Faction(132,5); -- Guardians of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,30879,1000); -- Rebirth Leather Gloves
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30873, item2 = 30873, item3 = 30873, item4 = 30873})) then -- 4x A Sharp Toothed Jawbone
		e.self:Say("Thank you for bringing these to me " .. e.other:GetName() .. ".");
		e.self:Emote("Karina closes her eyes and meditates over the jawbones for a moment.");
		e.self:Say("I can sense the mark of the [Loda Kai] within these jawbones. This is a horror, for Loda Kai was once a member of my people. I do not know how he came about these strange magical forces but it can not be good news. Please wear these sleeves for protection. This new discovery worries me deeply.");
		e.other:Faction(132,5); -- Guardians of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,30877,1000); -- Rebirth Leather Sleeves
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30874, item2 = 30874, item3 = 30874, item4 = 30874})) then -- 4x A Rotting Jawbone
		e.other:Faction(132,5); -- Guardians of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,30880,1000); -- Rebirth Leather Leggings
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30871, item2 = 30871, item3 = 30871, item4 = 30871})) then -- 4x A Shattered Jawbone
		e.other:Faction(132,5); -- Guardians of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,30881,1000); -- Rebirth Leather Boots
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
