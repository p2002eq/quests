---- Trooper Scale Armor
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("sighs heavily and after a long while says, 'Leave us, Iksar. Leave us to our eternal damnation.");
	elseif(e.message:findi("Curse")) then
		e.self:Emote("twists his face into a frown and says, 'You read what's written, Iksar. It's clear enough so we won't bother to explain the details. We can only stand our guard and hope for [" .. eq.say_link("redemption") .. "].");
	elseif(e.message:findi("redemption")) then
		e.self:Say("grits his teeth and snaps, 'It's very simple, " .. e.other:GetName() .. "! We are fallen! We seek redemption! We guard our 'brothers' here among the Howling Stones until we are relieved. Whether that will ever happen, we do not know. We can only hope that by providing the great warriors of the legion with our [" .. eq.say_link("ancient armor") .. "], we will earn salvation.");
	elseif(e.message:findi("ancient armor")) then
		e.self:Say("You wish the armor of our ancestors? The armor donned by the Guard whose duty was to protect the Chosen? A warrior relies not on strength alone, but many virtues. If a warrior learns to balance each virtue, then he may be fit to guard the Chosen. Each piece of armor reflects a [" .. eq.say_link("virtue") .. "], and each virtue must be learned before the armor is given.");
	elseif(e.message:findi("virtue")) then
		e.self:Say("The armor I keep are the symbols of focus, sacrifice, and perseverence. The [" .. eq.say_link("helm") .. "], [" .. eq.say_link("pauldrons") .. "], [" .. eq.say_link("vambraces") .. "], and [" .. eq.say_link("breastplate") .. "]. You must bring me proof that you know these virtues before attaining the armor I keep. I also will need a piece of Banded armor of the type you desire. My brother keeps the other pieces.");
	elseif(e.message:findi("helm")) then
		e.self:Say("You must first learn focus before being awarded the legionnaire scale helm. The Swifttails are the masters of focus and as such you will learn from the Grand Master of the Court. It has been so long, I do not know who is Grand Master now. Whoever it is, give him this note and follow his instruction. Once you have learned, return to us and the helm will be yours.");
		e.other:SummonItem(14788); -- Illegible Note: Helm
	elseif(e.message:findi("breastplate")) then
		e.self:Say("The monk is the master of focus, the shaman of sacrifice and the shadowknight of righteousness. Lastly, our brothers of the dark know confidence. It is then our duty to know perseverence more than any other. When others fall from spear and sword, we must stand. When others are washed away by fire and ice, we must stand. When others are frustrated and confused, we must continue on. There is a warrior in the swamp near the city. He is an exile, like my brother and I. He knows more about being a warrior than any baron in Cabilis. Take this note to him.");
		e.other:SummonItem(14789); -- Illegible Note: Breastplate
	elseif(e.message:findi("pauldrons")) then
		e.self:Say("Upon our shoulders we carry the virtue of sacrifice. Our bodies are ruined in the name of our Lord. Pain and suffering please him and our ancestors. Without knowing sacrifice, a warrior can never protect his charge from harm as he sees himself as greater than his duty. The mystics embody sacrifice. Find their highest authority and give him this note. He will recognize it.");
		e.other:SummonItem(14795); -- Illegible Note: Pauldron
	elseif(e.message:findi("vambraces")) then
		e.self:Say("Our arms carry more than the weapons of war and the hands that make use of them. We sacrifice the strength in our arms to carry our duties and obligations. Unless we can sacrifice our own bodies and abilities to carry these ideals, we will never be fit to protect the Chosen. Take this note to the master of the mystics in Cabilis, he will teach you a lesson in sacrifice.");
		e.other:SummonItem(14790); -- Illegible Note: Vambraces
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 14783, item2 = 3053})) then -- Glox Reference and Banded Helm
		e.self:Say("Well done");
		e.other:QuestReward(e.self,0,0,0,0,4976,1000); -- Trooper Scale Helm
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 14786, item2 = 3060})) then -- Vek's Reference: Vambraces and Banded Sleeves
		e.self:Say("Well done");
		e.other:QuestReward(e.self,0,0,0,0,4979,1000); -- Trooper Scale Vambraces
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 14819, item2 = 3056})) then -- Streavens Head and Banded Mail
		e.self:Say("Well done");
		e.other:QuestReward(e.self,0,0,0,0,4977,1000); -- Trooper Scale Breastplate
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 14787, item2 = 3057})) then -- Vek's Reference: Pauldrons and Banded Mantle
		e.self:Say("Well done");
		e.other:QuestReward(e.self,0,0,0,0,4978,1000); -- Trooper Scale Pauldron
	end
	item_lib.return_items(e.self, e.other, e.trade)
end