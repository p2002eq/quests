-- Whistling Fists quest
function event_say(e)
	local qglobals = eq.get_qglobals(e.self,e.other);
	if(e.message:findi("hail")) then
		e.self:Emote("hiccups and breathes drunken breath in your face saying, Leave me be, can't you see that I am meditating or something?");
	elseif(e.message:findi("master tynn") and (qglobals["Brew"] == "1")) then
		e.self:Say("Supreme Master Tynn was the only one that has even seen the weapon. I do not know its origin. I tell you though, you would need to be as powerful as he was to be able to wield the weapon. Only an Iksar of the last rung would be able to use it, come back and show me you have earned your [" .. eq.say_link("Tynnonium Shackle") .. "] and I will discuss with you what I know.");
	elseif(e.message:findi("tynnonium shackle") and (qglobals["Brew"] == "1")) then
		e.self:Say("Veltar was one with the ways of Tynn. He did return to Cabilis, I know you have rescued him from his cell. He has traveled afar to clear his mind of his torture in the mines. He did not say where his travels would take him. You will have to find him once more and ask him about the Tynnonium Shackle he still wears.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 8348, item2 = 8348, item3 = 8348, item4 = 8348})) then -- 4x Trog Brew
		e.self:Say("Ha! How did you know my favorite drink? Master Rinmark told you? That crazy old monk spends his days sitting on that mountain in Timorous Deep doesn't he? And they call me a drunkard! Anyhow, I bet he told you about the Whistling Fists. I have never seen them myself, and have only heard legend passed down by [" .. eq.say_link("Master Tynn") .. "].");
		e.other:Ding();
		eq.set_global("Brew","1",0,"F");
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4199})) then -- Shackle of Tynnonium
		e.self:Say("Ah, a monk of the final rung. You should seek Gandan Tailfist in Charasis. He, too, was seeking for a way to advance even further.");
		eq.delete_global("Brew");
		e.other:QuestReward(e.self,0,0,0,0,4199); -- Shackle of Tynnonium
	end
	item_lib.return_items(e.self, e.other, e.trade)
end