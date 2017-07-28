function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Bark! Lo furless one. My people are Snowfang. Once mighty tribe, now snowfang home lost to [" .. eq.say_link("vengeful winter") .. "].");
	elseif(e.message:findi("vengeful winter")) then
		e.self:Say("Our tribe once many strong, then vengeful winter come. Tribe grow lost in storm of ice. Many moon, no food, no water, no home. Many snowfang die, many snowfang leave to find [" .. eq.say_link("new home") .. "].");
	elseif(e.message:findi("new home")) then
		e.self:Say("Many go north, not see again. Many family go, Keref family go. Aroooooooo. Someday Keref become brave, like mighty hero [" .. eq.say_link("Groumshak") .. "]. Keref go find pack to north.");
	elseif(e.message:findi("Groumshak")) then
		e.self:Say("Groumshak mighty snowfang hero. Groumshak make battle with furless one fifty paws high. When Groumshak return to tribe, vengeful winter fall. If you bring Keref mighty harpoon like Groumshak, then Keref become hero like Groumshak. Will give totem of great protection for thanks.");
	
	
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30052})) then
		e.self:emote("gasps in astonishment.");
		e.self:say("This true hero weapon. This just like harpoon of mighty Groumshak! Now I can find family! Many thanks, friend to Snowfang. Take this for thanks. It protect from danger.");
		e.self:emote("hands you an intricately carved ice totem. A feeling of safety washes over you as he places it in your hand.");
		e.other:QuestReward(e.self,0,0,0,0,30051,1000);
		e.other:Faction(303, 30);
		e.other:Faction(345, -30);
		
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--fiddle