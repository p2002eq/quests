---- Trooper Scale Armor
function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18206)) then -- Guild Summons
		e.other:Message(15,"As your reptilian eyes adjust to the darkness of the room, an imposing Iksar turns towards you, addressing you with a sharp hiss. 'I am Prime Patriarch Vuzx. The time has come young one. You have chosen the path of the Beastlord. Open your inventory and read the note within. Once you are ready to begin your training, hand the note to me and we will continue.'");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Praise to the ancients, my friend! There is much suffering to be given unto the world. I am the Prime Hierophant of the Temple of Terror.  Through me and my fellow priests flows the wisdom of our ancestors.");
	end
	if(e.message:findi("unique weapon")) then
		e.self:Say("This goblin is known as a pit fighter. Though they are small, weak, and unintelligent, they still maintain a level of ferocity that surpasses that of most wild animals. This, along with a disgusting and perverse imagination, has allowed these pit fighters to reach heights of physical power most Iksar never see. This paticular fighter uses his tongue liberally while fighting. He has ingested many deadly contagions and licked things from the slimy surfaces of the darkest and dankest crevasses imaginable. His tongue will do well to further our cause in pain and suffering.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18206})) then -- Guild Summons
		e.self:Say("Welcome, young petitioner. You have been summoned to this temple to join with the Scaled Mystics. Ours is the way of pain and suffering. Here is the weapon of a petitioner. Through you the power of our ancestors shall flow. As your wisdom grows, so shall your power. Someday you may be a vessel for the supreme might of the ancients. Seek knowldege within this temple. The hierophants are here to guide you.");
		e.other:Faction(282,100); -- Scaled Mystics
		e.other:Faction(193,25); -- Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,0,5140,100); -- Iron Cudgel of the Petitioner
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18462, item2 = 22917})) then -- Solid Black Tome and Frozen Soulstone
		e.self:Emote("smiles at your dedication to Cazic Thule and hands you a small gem.");
		e.other:Faction(317,20); -- Swift Tails
		e.other:Faction(193,10); -- Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,0,7881,20000); -- Mark of Clarity
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18359, item2 = 22916})) then -- Dark Black Tome and Skyfire Pumice
		e.self:Emote("smiles at your dedication to Cazic Thule and hands you a small gem.");
		e.other:Faction(317,20); -- Swift Tails
		e.other:Faction(193,10); -- Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,0,7881,20000); -- Mark of Clarity
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 14790})) then -- Illegible Note: Vambraces
		e.self:Emote("stares down at the note, confused, until he recognizes the writing and gasps in shock!");
		e.self:Say("You spoke to the Brothers? You, a simple Legionnaire? Well, no matter, you are here to test your virtue of sacrifice and we will take pleasure in it as we have for generations even before the Fallen Brothers. One of our greatest allies in pain is disease. In the woods outside our fair city is a small tribe of goblins. There is a certain goblin famed for his [unique weapon]. Take this knife and use it to cut this from the goblin. Then return his weapon, the knife, a sapphire, and an opal to me.");
		e.other:QuestReward(e.self,0,0,0,0,14784,100); -- Hierophants Knife
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 14795})) then -- Illegible Note: Pauldron
		e.self:Emote("stares down at the note, confused, until he recognizes the writing.");
		e.self:Say("I need you to take care of a problem I have. There is a froglok slave that i need eliminated. You should use a Grayish Liquid to dispatch him.");
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 14784, item2 = 14785, item3 = 10034, item4 = 10030})) then -- Hierophants Knife, Diseased Tongue, Sapphire and Opal
		e.self:Say("Well done");
		e.other:QuestReward(e.self,0,0,0,0,14786,10000); -- Vek's Reference: Vambraces
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 14805, item2 = 10033, item3 = 10033})) then -- Froglok Goo and 2x Fire Emerald
		e.other:QuestReward(e.self,0,0,0,0,14787,100); -- Vek's Reference: Pauldrons
	end
	item_lib.return_items(e.self, e.other, e.trade)
end