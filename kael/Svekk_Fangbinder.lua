function event_say(e)
	local messages = {"hail", "supplies", "giants", "eastern wastes", "wakening land", "great divide", "klezendian", }
	if (e.message:findi(messages)) and (e.other:GetFaction(e.self) > 5) then
		local random = eq.ChooseRandom(1, 2, 3);
		if random == 1 then
			e.self:Say("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.");
		elseif random == 2 then	
			e.self:Say("Is that your BREATH, or did something die in here?  Now go away!");
		elseif random == 3 then
			e.self:Say("I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.");
		end
	elseif (e.message:findi("hail")) and (e.other:GetFaction(e.self) <= 5) then
		e.self:Emote("Greetings, "..e.other:GetName()..".  I am Svekk, a humble servant of Wenglawks.  It is my job to keep track of the [" .. eq.say_link("supplies") .. "] here.  I also sell mundane wares.");
	elseif (e.message:findi("supplies")) and (e.other:GetFaction(e.self) <= 5) then	
		e.self:Say("We have all kinds of supplies!  Normally we deliver them to the [" .. eq.say_link("giants") .. "] who live outside Kael.");
	
	elseif (e.message:findi("giants")) and (e.other:GetFaction(e.self) <= 5) then	
		e.self:Say("There are several encampments in the [" .. eq.say_link("eastern wastes") .. "] that barter for supplies with us monthly.  The [" .. eq.say_link("great divide") .. "] also has a small outpost of Kromrif who strive to beat the Coldain back into their city of Thurgadin and of course the outposts in the wakening lands.  Our last batch of deliveries did not reach their intended targets.  The runners have not been heard from since they were dispatched either.");
	elseif (e.message:findi("eastern wastes")) and (e.other:GetFaction(e.self) <= 5) then	
		e.self:Say("The Kromrif of the Eastern wastes are more savage than those who dwell within Kael Drakkel.  Normally they can fend for themselves but recently Fjloaren of the Icebane clan has requested we help them with a shipment of supplies.  We have yet to receive payment for the supplies but you are more than welcome to purchase supplies for them and deliver them.  It has been a most unforgiving season upon the wastes I believe.");
	elseif (e.message:findi("great divide")) and (e.other:GetFaction(e.self) <= 5) then	
		e.self:Say("If you wish to deliver supplies to the warriors in the great divide that is wonderful. One small problem arises.   I do not know you, "..e.other:Race()..".  I would not trust you as far as I could throw a dragon.  If you pay for the supplies and deliver them the men at the fortress will surely repay you.  A pack of basic supplies only costs a meager five hundred gold pieces.  If you choose to purchase the supplies and deliver them take them to a man named Bekerak Coldbones at the outpost.");
	elseif (e.message:findi("klezendian")) and (e.other:GetFaction(e.self) <= 5) then	
		e.self:Say("Klezendian crystals can be found in the Crystal Caverns beneath the eastern wastes.  The Rygorr orcs mine Velium and various metals from its rich walls.  Be warned though, the crystal caverns are not a safe place, nameless beasts and even some Coldain call It their home.");
	end
	
end

function event_trade(e)

	local item_lib = require('items');

	if (item_lib.check_turn_in(e.self, e.trade, {gold = 500} or {platinum = 50})) then
		e.self:Emote("heaves a large pack from a pile in the corner and sets it before you.  'I wish you luck in your endeavor, "..e.other:Race()..".'");
		e.other:QuestReward(e.self, 0,0,0,0, 25266, 250); --Giant Sack of Supplies
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 =  25278})) then
		e.other:QuestReward(e.self, 0 , 0, 0, 15, 0, 250);
		e.other:Faction(189, 10); --kromzek
		e.other:Faction(188, 10); --kromrif
		e.other:Faction(179, 10); -- KT
		e.other:Faction(42, -30); --CoV
 	--Could not find any information this quest just copied perl
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 =  25267})) then	
		e.self:Say("This is unbelievable!  The fool is asking for things I don't even have in stock!  Listen, "..e.other:GetName()..", you're the one that wanted to help them out, I'm just here working for Wenglawks.  I can get most of these supplies ready but I have no source for Klezendian Crystals.  I will start bundling the more mundane items Bekerak wants.  If you find any [" .. eq.say_link("Klezendian") .. "] return to me with the crystal and this voucher.");
		e.other:QuestReward(e.self, 0, 0, 0, 0, 25270, 250); --Supply Voucher
		e.other:Faction(189, 10); --kromzek
		e.other:Faction(188, 10); --kromrif
		e.other:Faction(179, 10); -- KT
		e.other:Faction(42, -30); --CoV
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 =  25270, item2 = 25271})) then
		e.self:Say("Did you travel to the crystal caverns to get that crystal, "..e.other:GetName().."?  You are quite brave for a "..e.other:Race()..".  I have the other supplies ready for your trip, they are quite heavy but I think you will get by.");
		e.other:QuestReward(e.self, 0, 0, 0, 0, 25269, 250); --Large Supply Sack for Bekerak		
		e.other:Faction(189, 10); --kromzek
		e.other:Faction(188, 10); --kromrif
		e.other:Faction(179, 10); -- KT
		e.other:Faction(42, -30); --CoV
	end

	item_lib.return_items(e.self, e.other, e.trade);	

end
