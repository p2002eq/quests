-- Telkorenar's WToV tests: Test of Protection, Fire Storm, Living Flame, Tooth

function event_say(e)
	if e.other:GetFaction(e.self) == 1 then  -- req ally CoV
		if e.message:findi("hail") then
			e.self:Say(string.format("The Strong seek me out, for one reason or another. It seems you have come here in peace. Perhaps you wish to [" .. eq.say_link("") .. "]prove yourself a mighty %s? I respect only might!", e.other:GetClass()));
		elseif e.message:findi("wish to prove") then
			e.self:Say("For the mighty I have four tests. The [" .. eq.say_link("test of the tooth") .. "], the [" .. eq.say_link("test of the flame") .. "], the [" .. eq.say_link("test of the fire storm") .. "], and the [" .. eq.say_link("test of protection") .. "]. Which test do you wish to undertake?");
		elseif e.message:findi("test of the tooth") then
			e.self:Say("With tooth and nail you must fight, deep into the halls of testing. Recover the white tear of power, the white symbol for purity, the silver symbol to calm ones self, and a glowing orb. If you can return these to me I will know you are a mighty fighter indeed.");
		elseif e.message:findi("test of the flame") then
			e.self:Say("Return the black tear, the black symbol, the poison symbol, and the serrated symbol to me and you will have completed the test of flame. Your reward will be quite suitable to one who enters the fray of battle.");
		elseif e.message:findi("test of the fire storm") then
			e.self:Say("Become like a fire storm and bring your wrath upon the inhabitants of the halls of testing. Return when you have the tear of poison and the serrated tear along with the a symbol kissed by flames and a ruby symbol.");
		elseif e.message:findi("test of protection") then
			e.self:Say("My fire will protect you if you are strong enough to endure this test. A ruby tear like my flames, an emerald tear like a forest ready to burn, an emerald symbol, and a platinum symbol are what I seek. With these I will forge pauldrons unlike any you have ever seen mortal. Go now and seek out what I desire.");
		end
	else
		e.self:Say("I do not know you well enough to entrust you with such a quest, yet.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFaction(e.self) <= 1) then
		if(item_lib.check_turn_in(e.self, e.trade, {item1 = 31257, item2 = 31268, item3 = 31270, item4 = 31258})) then
			give_reward(e.self, e.other, 31472);
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 31260, item2 = 31253, item3 = 31261, item4 = 31250})) then
			give_reward(e.self, e.other, 31469);
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 31262, item2 = 31251, item3 = 31255, item4 = 31254})) then
			give_reward(e.self, e.other, 31470);
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 31256, item2 = 31266, item3 = 31265, item4 = 31259})) then
			give_reward(e.self, e.other, 31471);
		end
	else
		e.self:Say("I do not know you well enough to entrust you with such an item, yet.");
	end
	
	item_lib.return_items(e.self, e.other, e.trade)
end

function give_reward(self, other, item)
	self:Emote("looks pleased as he hands you the reward.");
	other:Faction(42,50); -- CoV
	other:Faction(362,25); -- Yeli
	other:Faction(189,-100); -- Kromzek
	other:QuestReward(self,0,0,0,0,item,200000);
end
