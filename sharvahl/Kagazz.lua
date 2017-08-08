function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ale you say? No ale here friend, I am a blacksmith. You'll have to speak loud and clearly by the way, I don't hear so well since the [" .. eq.say_link("incident") .. "]. Show me your slate if you're looking for work.");
	elseif(e.message:findi("incident")) then
		e.self:Say("I was quite a homely yet sensitive lad, bad combination. As I was growing up I was teased mercilessly. In an effort to block out the ridicule I habitually placed my fingers into my ears. My claws must have done some kind of permanent damage.");
	elseif(e.message:findi("fasteners")) then
		e.self:Say("Ah, Poren must have sent you. May I inspect your slate first?"); --Still need real text
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 2877})) then -- Acrylia Slate of Shar Vahl
		e.self:Say("My wife is making some jewelry. Not the sparkly stuff, mind you. She is nearly blind so appearance means little to her. She is intent on making jewelry with a more, uhh, natural feel. Currently she's constructing a special scorpion leg necklace, and is in need of more scorpion legs. I can't leave the shop so I need your help. Fill this box with scorpion legs and I'll pay you with metal [" .. eq.say_link("fasteners") .. "] that any merchant will gladly buy.");
		e.other:SummonItem(2877); -- Acrylia Slate of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,17238); -- Kagazz's Box
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 3676})) then -- Box of Scorpion Legs
		e.self:Say("Excellent! My wife will be happy to continue working on her necklace. Take these fasteners as payment for your assistance."); --Still need real text
		e.other:QuestReward(e.self,0,0,0,0,3667); -- Forged Fasteners
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
