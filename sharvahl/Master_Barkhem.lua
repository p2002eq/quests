-- Starting quest for luclin smithing
-- other npcs, repair orders : Khala_Dun_Jasir, Khala_Dun_Aihjin, Khala_Dun_Bokh, Khala_Dun_Koby
-- other npcs, end of the quest : Master_Taruun_Rakutah
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say('Welcome to my shop. Please feel free to look around at the armor we have available. If you are [looking for work], just let me know.');
	elseif(e.message:findi("Looking for work")) then
		e.self:Say("That's great news! I could really use a hand. I have constructed some shield frames ideal for use with the carapaces found on [bloodlings]. Unfortunately I do not have the time to collect any of the shells. You can either purchase the frames and keep the shields for yourself, or you can return them to me and I will compensate you for your troubles.");
	elseif(e.message:findi("Bloodlings")) then
		e.self:Say("Cht`Thk bloodlings are parasites found in the thickets just beyond the south gate. You best be careful, they have a habit of sucking the blood from a person and spreading diseases.");
	elseif(e.message:findi("repair order")) then
		e.self:Say("Huh? Oh, here is a repair order for the Guards' shields, I will only give you one at a time as I do not want you overworking yourself so early in your education.");
		e.other:SummonItem(29803); -- A Shield Repair Order
	elseif(e.message:findi("spirit anchor")) then
		e.self:Say("Have you not met Tiamon out in the Thicket yet? He is always telling anyone who wants to listen all about spirit anchors. Let me sum it up for you- the shadeweavers hunt the beings of shadow in the thicket to make their special shadow armor called Xakra. Now if you or I were to try to don this armor, it wouldn't last long as the shadows are not bound to this plane. Tiamon developed a [method of binding the spirits] in such a way that they will last. Mind you, he works with needles and threads- I work with the tools of a smith.");
	elseif(e.message:findi("binding the spirits")) then
		e.self:Say("When something has been exposed to great ritual and culture, like the stones used to build a city or the instrument of one of our bardic historians, it kind of develops its own memories, you might say, and becomes a suitable spirit anchor. When he was Master Smith of SharVahl City, Kagazz began collecting the discarded weapons and armor of our fallen heroes and melting them down to make smithing tools. In this way he honored their achievements by passing their experience into new weapons and armor for our young heroes-to-be. As it turns out, these anvils are very strong spirit anchors, so strong that you can [rend shadow] itself.");
	elseif(e.message:findi("rend shadow")) then
		e.self:Say("That's right. You will be working with the very fabric of shadow and sound, but we'll get to the sound part later. For now, hunt the shades in the Thicket; they hold moderate pieces of the power that you can use to experiment with. The mallet I gave you can be used to gather the shadows into a solid mass if you strike them on this anvil. You're probably best starting with something simple like [Shadow disks] to begin with.");
	elseif(e.message:findi("shadow disk")) then
		e.self:Say("Take swirling shadows from the shades in the Thicket and combine them with some metal bits to make a Shadow disk. Fill this box with disks and return it to me with my old mallet,' he pauses, considering your progress and smiling slightly, 'you will have earned your own at that point. Afterwards, I will show you how to manipulate sound to empower the shadows.");
		e.other:SummonItem(17498); -- Barkhem's box
	elseif(e.message:findi("humming orb")) then
		e.self:Say("You'll need to get a shrieking substance from the sonic wolves that roam the moor and then combine it with a wailing substance from an owlbear. You'll want to pound those two together onto some metal rings with your mallet and anvil to form the humming orb. About three orbs should be plenty. Bring them back to me with your new mallet and I will have something very special to show you.");
	elseif(e.message:findi("Shadowscream steel")) then
		e.self:Say("Shadowscream steel is made by striking the swirling shadows on your anvil with the Humming Luclinite Hammer and adding a sonic punch. For example, you might place two swirling shadows into a boot mold with a humming orb to make a pair of Shadowscream Steel Boots- use medium sized molds, the magical properties of the material will adjust to any size body. Come to think of it, I have a standing boot order you should be able to fill, it would make a great first job.'");
	elseif(e.message:findi("standing boot order")) then
		e.self:Say("Rakutah of the Taruun had asked if I would make a few pairs of boots for his new recruits, but alas I have not had the time. If you think you are ready for the job, make up a pair and show them to him. I have every bit of faith in you, " .. e.other:GetName() .. ".");
	end
end

function event_trade(e)
	local item_lib = require("items");
	-- You can buy Nepeta Oil Extract from a merchant named Chialle in the southern part of Shar Vahl. The mail sectional mold is sold by Apprentice Garr, near Master Barkhem. Combine the oil, mold and two plates in a forge (trivial 32) to create a Bloodling Plate Mail.
	-- give Bloodling plate mail
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30646})) then -- Bloodling Plate Helm
		e.other:SummonItem(30646); -- Bloodling Plate Helm
		vah_armor = 1;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30647})) then -- Bloodling Plate Mask
		e.other:SummonItem(30647); -- Bloodling Plate Mask
		vah_armor = 1;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30648})) then -- Bloodling Plate Gorget
		e.other:SummonItem(30648); -- Bloodling Plate Gorget
		vah_armor = 1;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30649})) then -- Bloodling Plate Mail
		e.other:SummonItem(30649); -- Bloodling Plate Mail
		vah_armor = 1;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30650})) then -- Bloodling Plate Mantle
		e.other:SummonItem(30650); -- Bloodling Plate Mantle
		vah_armor = 1;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30651})) then -- Bloodling Plate Cloak
		e.other:SummonItem(30651); -- Bloodling Plate Cloak
		vah_armor = 1;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30652})) then -- Bloodling Plate Belt
		e.other:SummonItem(30652); -- Bloodling Plate Belt
		vah_armor = 1;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30653})) then -- Bloodling Plate Sleeves
		e.other:SummonItem(30653); -- Bloodling Plate Sleeves
		vah_armor = 1;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30654})) then -- Bloodling Plate Bracer
		e.other:SummonItem(30654); -- Bloodling Plate Bracer
		vah_armor = 1;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30655})) then -- Bloodling Plate Gauntlets
		e.other:SummonItem(30655); -- Bloodling Plate Gauntlets
		vah_armor = 1;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30656})) then -- Bloodling Plate Leggings
		e.other:SummonItem(30656); -- Bloodling Plate Leggings
		vah_armor = 1;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30657})) then -- Bloodling Plate Boots
		e.other:SummonItem(30657); -- Bloodling Plate Boots
		vah_armor = 1;
	end
	if(vah_armor == 1) then
		e.self:Say("I knew that old thing would make a fine bit of armor in the right hands. Talent like yours should not go to waste! Take this, it is the mallet that I used to smith my very first bit, you can learn with it until you earn something better. Here is your first lesson " .. e.other:GetName() .. ", use this mallet to pound out the dents in the guard's shields. The ones guarding the bridges into town will need it most, as they can not leave their posts. Show each guard a [repair order] and have them sign off on it when you are through.");
		e.other:QuestReward(e.self,0,0,0,0,29802); -- Vah Shir Apprentice Mallet
		vah_armor = 0;
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30658, item2 = 30658})) then -- 2x Bloodling Shield
		e.self:Emote(" takes the shield from " .. e.other:GetName() .. " and glances it over");
		e.self:Emote("smiles and nods his head in approval before speaking. 'This is some quality work my friend. Although you could use some practice in your style, I can sense true potential in your smithing skills. This was too large for me to use for a shield, but I think you can craft it into some fairly good armor. Just treat it in a forge with nepeta oil and the proper mold, the oil should soften it up enough to become pliable. Once fired in the forge it will harden to the mold. I'd love to see how It turns out.'");
		e.other:SummonItem(30664); -- A Bloodling Carapace Plate
		e.other:QuestReward(e.self,0,0,0,0,30664); -- A Bloodling Carapace Plate
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29806, item2 = 29809, item3 = 29812, item4 = 29815})) then -- Kobys work order, Jasirs work order, Aihjins work order and Bokhs work order
		e.self:Emote("shuffles through the work orders. 'Well they have some lovely things to say about your work!'");
		e.self:Emote("disappears into the back room for a moment only to return dragging some sort of large iron block in his hands and crashes it down on the counter. 'Do you know what this is? I see you nodding your head, and yes it is an anvil... but it is so much more. This is a specially crafted anvil for only my most promising students as not just anyone has it within them to smith on a [spirit anchor].'");
		e.other:Faction(132,10); -- Guardians of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,29816,500); -- Vah Shir Anvil
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29802, item2 = 29819})) then -- Vah Shir Apprentice Mallet and Box of Shadow Disks
		e.self:Say("Well done, " .. e.other:GetName() .. "! I trust you are beginning to see the power that shadow can grant you. Now it is time for you to learn to manipulate sound. Here is your very own mallet, use it to form the substance of sound into tangible matter. Pound yourself out a few [humming orbs] and I'll know you're ready to combine shadow and sound into a precarious balance of forces.");
		e.other:Faction(132,10); -- Guardians of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,29820,500); -- Luclinite Mallet
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29820, item2 = 29823, item3 = 29823, item4 = 29823})) then -- Luclinite Mallet and 3x Humming Orb
		e.self:Emote("looks genuinely pleased with your craftsmanship. He sets down one of the orbs onto a special anvil and swings your mallet high in the air crashing it down on the orb causing it to shatter with a terrible shriek. He repeats this action with each of the remaining orbs and hands you back the now humming mallet. 'Here, " .. e.other:GetName() .. ", this mallet will enable you to combine shadow with sound. Smith wisely and be careful what you create with it,' Barkhem pauses, looking quite serious, 'it is very powerful. You'll be able to make [Shadowscream steel] with it.'");
		e.other:Faction(132,10); -- Guardians of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,29824,500); -- Humming Luclinite Mallet
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29826})) then -- Rakutahs Seal
		e.self:Say("Back already, " .. e.other:GetName() .. "? I've only just sent you out and you've finished your very first professional job, well done! I'm very proud of your progression! My wife and I have made you a pair of greaves that I'm sure you'll love to wear. Take them as a reward on a job well done. I have pressing matters that require my attention right now, or else I'd teach you more about the powers of shadow and sound. Experiment with the [Shadowscream steel] until I can teach you more.");
		e.other:Faction(132,10); -- Guardians of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,29827,500); -- Barkhems Fancy Pantaloons
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
