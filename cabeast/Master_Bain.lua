function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome.  Who has [sent] you to me?");
	elseif(e.message:findi("Grand Master Glox")) then
		e.self:Say("So Grand Master Glox has sent you?  You must be new to the court.  We are of the Swifttail caste as are you.  Under the guidance of masters such as I. You will forge your body into a weapon of pure destruction.  Do not bother the Grand Master.  He is in constant meditation and is bothered with only the most paramount of concerns.  Are you [ready to train]?");
	elseif(e.message:findi("ready to train")) then
		e.self:Say("Then I can offer training in the martial arts as well as other skills.  Please remember to obtain knowledge from our court chronicler.  You shall also begin to aid your brothers and sisters with [menial tasks].  All begin upon the rung of dust and all have done these tasks in order to climb to the next rung.");
	elseif(e.message:findi("menial tasks")) then
		e.self:Say("We have a few menial tasks we require our young members to perform.  Young members must [tailor training bags] for our court.");
	elseif(e.message:findi("tailor training bags")) then
		e.self:Say("Then take this leech husk pouch and fill it with the obvious.  Once done, combine the skins and take the full leech husk pouch to a local tailor by the name of Klok Mugruk.  He is the one who cleans and toughens the husks for us. He shall hand you a ready-made training bag husk.  He will instruct you further.");
		e.other:SummonItem(17998); -- Leech Husk Pouch
	elseif(e.message:findi("master rinmark")) then
		e.self:Say("Seeking Master Rinmark? He has left the Court of Pain. Gone to focus his thoughts on the elements of wind and thunder. I believe he was headed toward the Overthere. That was the last I heard of his trek.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18468, item2 = 22923})) then -- Pale White Tome and Vine Woven Basket
		e.self:Emote("smiles at your dedication to Cazic Thule and hands you a small gem.");
		e.other:Faction(317,20); -- Swift Tails
		e.other:Faction(193,10); -- Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,0,7881,20000); -- Mark of Clarity
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18467, item2 = 22922})) then
		e.self:Emote("smiles at your dedication to Cazic Thule and hands you a small gem.");
		e.other:Faction(317,20); -- Swift Tails
		e.other:Faction(193,10); -- Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,0,7881,20000); -- Mark of Clarity
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12688})) then -- Monk Training Bag
		e.self:Say("Excellent work young one. Take this armor and wear it with pride!");
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(4350,4351,4352,4353,4354,4355,4356,4357,4358,4359),100); -- Random Sparring Armor Piece
	end
	item_lib.return_items(e.self, e.other, e.trade)
end