-- Shaman Skull Quest 7
function event_trade(e)
	local qglobals = eq.get_qglobals(e.self,e.other);
	local item_lib = require("items");
	if(tonumber(qglobals.shmskullquest) >= 11 and item_lib.check_turn_in(e.self, e.trade, {item1 = 30984})) then -- A Dusty Iksar Skull
		e.self:Emote("runs his scaled fingers slowly over the cracked, brittle skull. 'Granix did well to send you to me, I may yet be able to recover the spirit of this ancient and set it free. Come! I shall need your help with this ritual.'");
		e.self:Emote("dips the skull in the crystal waters. He lifts the skull over his head and stands completely still, allowing the water to drip down off the skull down over his body and finally on to the parched sand.'");
		e.self:Emote("begins to chant. Quietly at first but then louder and faster. He speaks a language you only vaguely recognize. It is the voice and language of the ancient oracles. His voice booms out over the water filling your mind with images of the ancient Sebilisian empire and the great Iksar rulers of old.");
		e.self:Emote("voice stops suddenly, leaving the air completely silent. Even the waves seem to have stopped for a moment. You begin to move toward him, but he raises a hand toward you motioning for you to stay still.");
		e.self:Say("Suddenly without warning the skull flies from Quilin's hands and flies into the murky waters. It stays submerged for a moment and then flies toward you, but this time an entire corpse is attached to it.");
		e.self:Emote("");
		eq.spawn2(78000,0,0,e.self:GetX() + 5,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- An Arisen Iksar
		e.other:QuestReward(e.self,0,0,0,0,30984,0); -- give the skull back incase you fail
	--Turn in the Wet Skull Fragments
	elseif(tonumber(qglobals.shmskullquest) >= 11 and item_lib.check_turn_in(e.self, e.trade, {item1 = 30985})) then -- Wet Skull Fragments
		e.self:Say("It seems this particular ancient does not wish to be put to rest. Return this note to Hierophant Granix and tell him what happened. He will surely wish this skull to be disposed of properly, but I do not have the power to do it myself.");
		e.other:QuestReward(e.self,0,0,0,0,30986); -- Note to Granix
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
