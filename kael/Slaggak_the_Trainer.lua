function event_say(e)

	if (e.other:GetFaction(e.self) <= 5) then --Indifferent or lower
		if (e.message:findi("hail")) then
			e.self:Say("Hello there, "..e.other:Race()..". I am Slaggak, the trainer. The Kromrif here will soon be ready to [" .. eq.say_link("serve") .. "] the great and honorable King Tormax.");
		elseif (e.message:findi("serve")) then	
			e.self:Say("So you say, little one. Why are you here, then? You should be out slaying those pestering little [" .. eq.say_link("Coldain") .. "] or maybe those damnable [" .. eq.say_link("shard wurms") .. "] and wyverns.");
		elseif (e.message:findi("coldain")) then	
			e.self:Say("The Coldain are the ice dwarves. They have defiled our lands for long enough. Thinking of them makes my blood run hot. With my new position as trainer, I am not allowed to roam the lands and slaughter their kind as I once did.' Slaggak sighs. 'I long for the days when I could fashion necklaces from their [" .. eq.say_link("skulls") .. "].");
		elseif (e.message:findi("skulls")) then
			e.self:Say("The Coldain are the ice dwarves. They have defiled our lands for long enough. Thinking of them makes my blood run hot. With my new position as trainer, I am not allowed to roam the lands and slaughter their kind as I once did.' Slaggak sighs. 'I long for the days when I could fashion necklaces from their skulls.");
		elseif (e.message:findi("shard wurm")) then	
			e.self:Say("You must have seen the shard wurms by now! The lizards that roam the lands eating whatever they can find? They can grow to be quite ferocious! Not nearly as ferocious as their ancient cousins, the dragons, but a nuisance nonetheless. We have a [" .. eq.say_link("bounty") .. "] on those beasts here in Kael Drakkel.");
		elseif (e.message:findi("bounty")) then	
			e.self:Say("If you think you have what it takes to slay the shard wurms or their relatives, the wyverns, bring back proof of your exploits. For every four shard wurm fang you bring me, I am authorized to reward you with a pair of cerulean greaves. Every fourth ice wyvern stinger will grant you a pair of vambraces.");
		end
	else
		e.self:Say("Your loyalty to our ideals has yet to be proven.");
	end
end

function event_trade(e)

	local item_lib = require('items');
	if (e.other:GetFaction(e.self) <= 5) then --indifferent or lower
		if (item_lib.check_turn_in(e.self, e.trade, {item1 = 30081})) then
			local randomScaleItem = eq.ChooseRandom(25011, 25016, 25013, 25010, 25017, 25014, 25007, 25005, 25015, 25009, 25006, 25012, 25018); --random Giant Scalemail piece
			e.other:SummonItem(randomScaleItem);
		elseif (item_lib.check_turn_in(e.self, e.trade, {item1 =  25100, item2 = 25100, item3 = 25100, item4 = 25100})) then	
			e.other:SummonItem(25071);
		elseif (item_lib.check_turn_in(e.self, e.trade, {item1 =  25101, item2 = 25101, item3 = 25101, item4 = 25101})) then	
			e.other:SummonItem(25070);
		end
		e.other:Faction(188, 20); --kromrif
		e.other:Faction(189, 20); --kromzek
		e.other:Faction(49, -60); --coldain
		e.other:Faction(42, -60); --CoV
		e.other:AddEXP(100);
	else
		e.self:Say("I will do nothing to aid the likes of you.");
	end

end
