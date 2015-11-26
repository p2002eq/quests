function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail to you my friend "..e.other:GetName().."! I am Torm Wenrar, proud warrior of the Draconic Loyalist Fellowship. The dragons and dragon-kin of Skyshrine have need of capable warriors to aid in the war with the giants of Kael Drakkel. Do not consider this a sign of weakness, even the most powerful beings benefit from having friends and allies. The Giants too have many beings in their service, Ogres, Trolls, and unfortunately even Northmen like myself have been hired into the service of the Kromzek. These mercenaries must be put down, perhaps if enough of them are slain, other sell swords would be deterred from seeking employment of the Kromzek. The dragon-kin have placed a [bounty] on the lives of the Kromzeks mercenaries, any aid you can provide to the Skyshrine would be well rewarded.");
	elseif(e.message:findi("bounty")) then
		e.self:Say("You shall be rewarded from skyshrines treasure hordes for the Kromzek Mercenary Brooches of every three mercenaries in the Kromzeks employment you slay. If you manage to locate and slay the [mercenary captains], or the more [notorious mercenaries] the rewards will be greater.");
	elseif(e.message:findi("mercenary captains")) then
		e.self:Say("There are four mercenaries that have been promoted by the Kromzek to the position of mercenary captain. These captains command various units of mercenaries, usually those of their own race. The military prowess of the Kromzek, Kromrif, and their followers should not be underestimated. These individuals are very good at what they have been hired to achieve. There is a bounty available for the personalized mercenary brooches of Captain Glarg, Captain Ulmog, and Captain Mc'Hersh. Recover all three of the brooches and return them to me as proof of the captains deaths and I shall reward you from the treasure coffers of Skyshrine.");
	elseif(e.message:findi("notorious mercenaries")) then
		e.self:Say("There is a bounty for the lives of four mercenaries that have become notorious killers of dragon-kin. Since these mercenaries are not adorned with personalized brooches like the mercenary captain, their heads must be returned to me as proof of their deaths. The four mercenaries can usually be found together hunting dragons and dragon-kin. The first of these despicable individuals is a human by the name of Julius Oresco, a warrior of great skill. Julius' dragon hunting band is composed of the Dwarf, Grenth Drakebane, the erudite, Sadeem Oujva, and the northman, Rontar O'Karn. Bring me the heads of the four notorious mercenaries and I shall reward you on behalf of the dragon-kin from the treasure hoards of Skyshrine.");
	end	
end

function event_trade(e)
	local item_lib = require('items');

	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 11990, item2 = 11990, item3 = 11990})) then
		e.self:Say("Well done "..e.other:GetName().."! The Draconic Loyalist Fellowship and the residents of Skyshrine are grateful for your assistance in eliminating the threat the Kromzeks mercenaries pose to the dragons and dragon-kin of Velious. Here is the bounty that has been promised.");
		e.other:Faction(362, 25); --Yelinak
		e.other:Faction(42, 25); --Cov
		e.other:Faction(189, -25); --Kromzek
		e.other:QuestReward(e.self, 0, 0, 0, 0, 12555, 1000); --Potion of Dranoic Rage
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 11991, item2 = 11992, item3 = 11993})) then
		e.self:Say("This is good news indeed for the dragon-kin of Skyshrine. Word will be passed to the rulers of Skyshrine of the assistance you have provided the Draconic Loyalist Fellowship. Here is the bounty that has been promised for the lives of the mercenary captains.");
		e.other:Faction(362, 50); --Yelinak
		e.other:Faction(42, 50); --Cov
		e.other:Faction(189, -50); --Kromzek
		e.other:QuestReward(e.self, 0, 0, 0, 0, 12556, 1500); --Draconic Girdle
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 11994, item2 = 11995, item3 = 11996, item4 = 11997})) then
		e.other:Faction(362, 100); --Yelinak
		e.other:Faction(42, 100); --Cov
		e.other:Faction(189, -100); --Kromzek
		e.other:QuestReward(e.self, 0, 0, 0, 0, 12556, 1500); --Draconic Girdle
	end

	item_lib.return_items(e.self, e.other, e.trade);
end


