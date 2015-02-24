function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Begone unless you seek the armor of the [trooper]");
	elseif(e.message:findi("trooper")) then
		e.self:Say("I can provide [boots], [bracer], [guantlets], or [greaves]");
	elseif(e.message:findi("boots")) then
		e.self:Say("You wish the boots worn by the ancients? Then you must first master the virtue of confidence. For our brothers of the dead, confidence is the virtue that allows them to control the forces that would tear them apart if they knew it not. When a warrior steps, he must be confident, for a weak step cannot crush your enemies. Take this note to the current Harbinger in Cabilis and learn from him.");
		e.other:SummonItem(14794);
	elseif(e.message:findi("bracer")) then
		e.self:Say("The bracers of our ancestors embody righteousness. When we strike, and our forearms are soaked in the blood of our enemies, our purpose must be pure. Else that blood will burn our souls and anger that which we live for. Go and find the Archduke in Cabilis and give him my note. He will teach you of righteousness. For if our chosen did not know righteousness, our people would not be. Go!");
		e.other:SummonItem(14791);
	elseif(e.message:findi("guantlets")) then
		e.self:Say("Our hands are our most useful and deadly instruments, after our minds. When we use them other than in service of our lord and ancestors, our actions are false. Without knowing righteousness we can never be sure if our actions are in the name of fear. The Chosen, the Crusaders of Greenmist, know fear intimately. Their actions are never without the blessing of our lord. Take this note to the Archduke. He will recognize my writing and instruct you.");
		e.other:SummonItem(14792);
	elseif(e.message:findi("greaves")) then
		e.self:Say("Our legs move us forward. If we move with hesitance we will surely fall and leave our charge exposed. Before you can wear the greaves, you must learn from the Brood of Kotiz. For if they did not wield their powers over the dead with confidence, their life forces would be sucked from them instantly, leaving them empty husks. Take this note to the Harbinger and listen to his instructions.");
		e.other:SummonItem(14793);
	end
end
function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 14813, item2 = 3064})) then
		e.other:QuestReward(e.self,0,0,0,0,4983,10000);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 14808, item2 = 3061})) then
		e.other:QuestReward(e.self,0,0,0,0,4980,10000);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 14831, item2 = 3063})) then
		e.other:QuestReward(e.self,0,0,0,0,4982,10000);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 14809, item2 = 3062})) then
		e.other:QuestReward(e.self,0,0,0,0,4981,10000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
