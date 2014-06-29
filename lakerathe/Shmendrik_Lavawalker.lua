-- EPIC CLERIC

function event_death_complete(e)
	-- he will be killed probably by Natasha Whitewater.
	-- eqcastersrealm say that the player can also kill him, not important as long as he dies
	eq.signal(51138,599,2000);
end


function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, good " .. e.other:GetName() .. "!! Be wary near the waters of Lake Rathe! The Riptide goblin king, Lord Bergurgle, has been commanding his minions to murder and rob all who come near it! I am here seeking his death but I am afraid I am no match for all of his subjects. I shall reward you greatly for the death of Lord Bergurgle. I simply ask that you bring me his crown as proof.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 28044})) then -- 28044 :  Lord Bergurgle's Crown
		e.self:Emote("shoves the crown into a scorch marked leather satchel and cackles uncontrollably as madness twists his features and flames dance in his eyes. 'You, " .. e.other:GetName() .. ", have reduced the Riptides into chaos! Without a king to keep them in control they will ravage the settlements surrounding this lake! After the slaughter I shall return and easily burn the remainder of the villages and fishing shanties to the ground! None shall escape the fires of the Tyrant!!'");
		e.other:SummonItem(28045); -- 28045  Oil of Fennin Ro
		eq.spawn2(51138,0,0,111,3627.3,51,192.4);

		--local entid=eq.unique_spawn(51138,0,0,111,3627.3,51,192.4); -- Natasha Whitewater, spawns in the hut nearby (loc to be adjusted)
		--local mob=eq.get_entity_list():GetMobID(entid);
		--local mobnpc=mob:CastToNPC();
		--mobnpc:AddToHateList(npc,1); -- she attacks Shmendrik
	end
	item_lib.return_items(e.self, e.other, e.trade) -- return unused items
end

function event_signal(e)
	if(e.signal == 99) then
		e.self:Say("I'll slay you like I slaughtered your fellow missionaries! The Triumvirate can not decide the fate of a follower of the Tyrant!!");
		eq.signal(51138,199,2000);
	end
	if(e.signal == 299) then
		eq.signal(51138,399,2000);
	end
	if(e.signal == 499) then
		natasha = eq.get_entity_list():GetMobByNpcTypeID(51138);
		if(natasha) then
			getshmend = natasha:CastToNPC();
			getshmend:AddToHateList(npc, 1);
		end
	end
end

-- Zone:lakerathe  NPC:51012 -- Shmendrik_Lavawalker
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
