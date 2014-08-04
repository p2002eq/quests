function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Rrraaarrr! Hello furless. You come to study from [mighty warrior] yes?");
	elseif(e.message:findi("mighty warrior")) then
		e.self:Say("Errr. Well, Allix not yet mighty warrior but soon yes. Allix just come of age and soon will enter training to become mighty Pasdar. Errr. Allix little nervous. Allix missing [one thing] to become mighty Pasdar.");
	elseif(e.message:findi("one thing")) then
		e.self:Say("Well, Allix not have to have but is good. Is leaf. Ajrah leaf. Powerful magic in the leaf. Pasdar hold's next to body, keep's body strong and mind clear. Not have to have but Pasdar without Ajrah Leaf is poor Pasdar. Someday Allix travel to the mighty plain's of East Karana and get one from tree's.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 6349})) then
		e.self:Say("Ajrah! Raaarrr! Ajrah Leaf! Allix destined to be mighty saiar now! Allix unsure how to thank you. Here, take this. Is my most treasured tunic.");
		e.other:QuestReward(e.self,0,0,0,0,1120,500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end