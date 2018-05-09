function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	if e.message:findi("hail") and qglobals.pop_krelk_dialogue == nil then
		e.self:Emote("does not move his eyes from the blazing fire in front of him. As you watch. you can see the flickering. glowing embers light up his face; the blaze jumps and snaps in his eyes. a sign that Krelk yearns for days long gone. You watch him for what seems like an eternity before you finally snap out of the daze and notice that he took no heed to your presence. It appears he is far too engulfed in the flame to respond."); 
		eq.set_global("pop_krelk_dialogue","1",5,"M30");
	elseif e.message:findi("hail") and tonumber(qglobals.pop_krelk_dialogue) == 1 then
		e.other:Message(7,"As though awakened from a deep dream, Krelk shakes his stare loose of the flame and looks at you, a sense of remorse now apparent in his eyes. He sighs and then looks toward the ground for comfort. 'And so another traveler has become lost in the abysmal caves of this wretched place, hmm? Alas, I feel that I have nothing for any new entrants into this dank, dark cave except for a sense of hopelessness; we've all lost hope that we'll ever see our homes, ever go back to the families we once had...' He drifts off as the flame consumes him again, once more leaving the world around him.");
		eq.set_global("pop_krelk_dialogue","2",5,"M30");
	elseif e.message:findi("hail") and tonumber(qglobals.pop_krelk_dialogue) == 2 then
		e.other:Message(7,"Once again, Krelk awakens from his dazed state. 'Oh, I'm so very sorry. Take a look outside if you haven't already and you'll see the Storms all around. Just outside is what they call the Plains of Srerendi. Many here have begun to call the beach where they wound up the Shores of the Lost. That's rather appropriate, don't you think? In any case, the Storms of Srerendi are foreboding and hostile, often leaving travelers in their wake and I recommend staying as far away from them as possible, unless you've got some kind of death wish.'");
		eq.set_global("pop_krelk_dialogue","3",5,"M30");
	elseif e.message:findi("hail") and tonumber(qglobals.pop_krelk_dialogue) == 3 then
		e.self:Emote("appears lost in thought as he stares endlessly into the blazing fire.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:postorms  ID:210049 -- Krelk_the_Drifter 


