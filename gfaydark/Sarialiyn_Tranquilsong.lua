function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Pleased to meet you " .. e.other:GetName() .. ". I am Sarialiyn Tranquilsong. Virtuoso of the Songweavers Kelethin division. I have spent all of my years here in Kelethin training our new recruits to ensure that all are ready to defend themselves once their adventures take them away from the Faydark and beyond. If you are a [young bard of Kelethin] then I might have some exercises for you to complete.");
	elseif(e.message:findi("bard of kelethin")) then
		e.self:Say("Well then you surely must be interested in some of the [training exercises] I have created for all young members of the Songweavers bard guild.");
	elseif(e.message:findi("training exercises")) then
		e.self:Say("The training exercises that I speak of are very important in the development of a young bards core abilities. You will have to rely on all of your skills including hunting and gathering to complete these tests but in the end you will be rewarded with a full set of your own armor that you will craft by your own hand. Are you ready to [begin the exercises]?");
	elseif(e.message:findi("begin the exercise")) then
		e.self:Say("Fantastic " .. e.other:GetName() .. ". here is your Melodic Assembly Kit. In this kit you will collect various items from all over the Faydark. Clan Crushbone and in our hometown of Kelethin. You will then combine these items in certain quantities inside your Assembly Kit to create armor materials. which are then placed in a forge with the applicable mold to yield your armor piece. As I provided you with your assembly kit. I can also provide you with the armor molds for Tranquilsong [Helms]. [Bracers]. [Armguards]. [Boots]. [Greaves]. [Gauntlets] and [Breastplates]. All you must do is simply tell me what armor piece you want to craft. and I shall give you the appropriate mold and material recipe.");
		e.other:SummonItem(17368);
	elseif(e.message:findi("bracers")) then
		e.self:Say("To create your bracer material you will need to combine 1 Brick of Crude Bronze. 1 Giant Wasp Venom Sac. 1 Basilisk Hatchling Hide and 1 Bandage in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Bracer of the Tranquilsong.");
		e.other:SummonItem(22611);
	elseif(e.message:findi("helms")) then
		e.self:Say("To create your helm material you will need to combine 2 Bricks of Crude Bronze. 1 Faerie Wing. 1 Royal Jelly and 1 Mead in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Helm of the Tranquilsong.");
		e.other:SummonItem(22610);
	elseif(e.message:findi("armguards")) then
		e.self:Say("To create your armguards material you will need to combine 2 Bricks of Crude Bronze. 2 Wasp Wings. 1 Large Widow Abdomen and 1 Medium Quality Wolf Skin in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Armguards of the Tranquilsong.");
		e.other:SummonItem(22613);
	elseif(e.message:findi("boots")) then
		e.self:Say("To create your boot material you will need to combine 3 Bricks of Crude Bronze. 1 Severed Orc Foot. 2 Pixie Wings and 1 Brownie Parts and 1 Silk Thread in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Boots of the Tranquilsong.");
		e.other:SummonItem(22612);
	elseif(e.message:findi("greaves")) then
		e.self:Say("To create your greaves material you will need to combine 4 Bricks of Crude Bronze. 1 Orc Skull. 1 Orc Scalp and 1 Orc Fibula in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Greaves of the Tranquilsong.");
		e.other:SummonItem(22614);
	elseif(e.message:findi("gauntlets")) then
		e.self:Say("To create your gauntlet material you will need to combine 3 Bricks of Crude Bronze. 1 Spider Legs. 1 Orc Sternum. 1 Orc Head and 1 Orc Humerus in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Gauntlets of the Tranquilsong.");
		e.other:SummonItem(22615);
	elseif(e.message:findi("breastplates")) then
		e.self:Say("To create your breastplate material you will need to combine 5 Bricks of Crude Bronze. 1 Orc Fibula. 1 Pristine Forest Drakeling Scale. 1 Golden Bandit Tooth. 1 Orc Eye and 1 Orc Ribcage in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Breastplate of the Tranquilsong. Once you have completed your armor set please return to me for I have one [final exercise] for you to complete.");
		e.other:SummonItem(22616);
	elseif(e.message:findi("final exercise")) then
		e.self:Say("I am going to ask that you infiltrate Clan Crushbone and find something that was stolen from me. I had recently received a brand new lute that was crafted for me by my friend in Freeport. It was stolen from me not too long ago when I had to venture towards Crushbone to help a new recruit like yourself. The Orc that stole it from me was quite fast. most definitely a scout. The vile beast did not stick around for it knew they could not best me in combat. Therefore I had no chance to [retrieve] my lute or to seek revenge.  Will you retrieve my lute for me " .. e.other:GetName() .. "?");
	elseif(e.message:findi("retrieve")) then
		e.self:Say("Fantastic " .. e.other:GetName() .. ". please return to me when you have found my lute. I also ask that you bring me 2 Orc Jawbones to prove that you are united with us in our war against the vile orcs. I hope to see you soon.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 22694,item2 = 22694,item3 = 27540})) then
		e.self:Say("I never though I would see my lute again. I owe you my sincere thanks " .. e.other:GetName() .. ". Please take this weapon that I carried for most of my days as a symbol of my gratitude. May it guide you to victory in all of your battles.");
		e.other:QuestReward(e.self,0,0,0,0,27533,500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end