function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome to Shar Vahl's North Gate District.  If you're looking to relax. you may want to grab a drink at the Trail's End.  It's right behind me on the left.  Take care.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 5550})) then
		e.self:Say("You must think you're pretty tough wearin a buckler like that, eh? Well well... Perhaps you're looking to hunt some bigger game, eh? Earn a little scruff on your ears like Kuash? I thought so. I know a good place for you to start... and it's part of your civil duty. Our scouts have always had trouble with the wolves in the moor. I'm thinkin that you can start there. Maybe break in a few of the younger wolves' paws, eh? I thought so. Put your buckler back on and take this bag. Fill it with wolf paws and bring it back to me. Maybe then I'll give you a real challenge.");
		e.other:SummonItem(5550);
		e.other:QuestReward(e.self,0,0,0,0,17114);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 6217})) then
		e.self:Say("Well, you're beginning to scare me you're so tough! Just pullin your tail. Those were some scary beasts, eh? I thought so. I've got a dagger that helps me to deal with them. It's made in a special way to hurt the wolves more than usual. If you want one, you're going to need to make your own. I still got the molds that I used when I was craftin blades for people. If you run this status report to Bookkeeper Leaha in the Grunt Forest outpost for me, I'll go by my house and get the molds for you. Sound like a deal? I thought so.");
		e.other:Faction( 132,10 );
		e.other:QuestReward(e.self,0,0,0,0,6219,1000);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 6221})) then
		e.self:Say("Thank you very much. I see you got it all filled out. I gathered up all of those molds for you while you were gone. You can even have this old hilt that I found with them. Make sure you keep them in a safe place. You're going to need them and the books that the book fellow Qua sells. He's got a bunch of them and a kit that you'll need. When you get done with makin your dagger, bring it back by here with your cloak and I'll show you a surprise!");
		e.other:SummonItem(6141);
		e.other:SummonItem(6142);
		e.other:Faction(132,10);
		e.other:QuestReward(e.self,0,0,0,0,6148,1000);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 5557, item2 = 6158})) then
		e.self:Say("You have done well --name.  Wear this cloak with pride and enjoy the benefits of being a Khala Dun Journeyman.");
		e.other:SummonItem(6222);
		e.other:QuestReward(e.self,0,0,0,0,6158,10000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
