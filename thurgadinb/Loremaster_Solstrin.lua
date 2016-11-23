function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("bows before you");
		e.self:Say("Greetings to you as well, "..e.other:GetName()..". I have recently heard many tales of your people and their glory. I am honored to welcome you to the Hall of Ancestors. Here our people come to pay tribute to the bravest and wisest of our kin who have passed from this life into Brell's holy domain. If you are interested I'd be happy to tell you a little bit about the heroes buried here.");
	elseif(e.message:findi("what heroes")) then	
		e.self:Emote("smiles at you, obviously pleased by your interest.");
		e.self:Say("This hall contains the bodies of Dain Frostreavers the I, II, and III as well as his grace Grand Historian Nicmar. There is also an empty bier in the back awaiting the next hero of our people. But the most sacred tomb of all lies right behind me here.");
	elseif(e.message:findi("sacred tomb")) then	
		e.self:Say("In this block of ice lie the sole remnants of our great father, leader, and founder, Colin Dain. While leading our people to the safety of the mountains following the destruction of our beloved Froststone. Colin came to a grim realization. He knew that there was no way our people could outrun the giants and safely get away. And so he took thirty volunteers and led them in a suicide ambush to halt the giants' chase while the rest of our people got away. Without his sacrifice, the Coldain might very well have been wiped out that day. Once we were safe, scouts were dispatched to the battle with the hope of finding survivors. Amidst the field of bodies they found this crown, axe, and breastplate which belonged to our beloved leader. Of Colin's actual body, no remnant was ever found.");
	elseif(e.message:findi("working with gemstones")) then
		e.self:Say("Aye, gems are placed within the armor. Brell is pleased with this fusion of ore and gem. The combination produces a sturdy piece of armor. You will need some Etching Tools to work with the gems. If you ask Meg Tucter for a set, she should have some laying about.");
	elseif(e.message:findi("issue kit")) then	
		e.self:Say("The Standard Issue Kit is what we issue to soldiers at the beginning of their mission. I have this empty one here. Before I give it to you, could you show me your Runed Coldain Prayer Shawl? I would like to see how skilled you are.");	
	end
end

function event_trade(e)
	local item_lib = require('items');

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 8896})) then
		e.self:Say("So, the Dain needs your assistance with the Field Plate. The Dain must trust you a great deal to impart the wisdom of our armor creation to you. Here are the tomes. The first details how to make the basic armor, the other details how to begin [working with gemstones]. If the Dain is asking you for them you should place them in an [Issue Kit]. May Brell guide your hand friend, good luck to you.");
		e.other:SummonItem(18610); --Forge of Icewell Arms (Royal Field Plate Study)
		e.other:SummonItem(18611); --Forge of Icewell Arms (Precious Gem Study)
	elseif item_lib.check_turn_in(e.self, e.trade, {item1 = 8895}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 1199}) then
		e.self:Say("Amazing, your skill is truly great. I am sorry that I had doubted you. Here is the empty Issue Kit. Place a full set of Imbued Royal Velium armor in it before giving it to the Dain.");
		e.other:SummonItem(17651); --Empty Coldain Issue Kit
		e.other:SummonItem(8895); --Coldain Prayer Shawl
	end

	item_lib.return_items(e.self, e.other, e.trade)
end
