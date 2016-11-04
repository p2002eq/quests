function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings and welcome to Thurgadin, "..e.other:GetName()..". I am Chamberlain Krystorf and it is my duty to assist the Dain in the management of Icewell Keep and the Royal Court. One could say that Seneschal Aldikar is the Sword of the Dain while I am the Shield, protecting all of his interests and those of the kingdom.");
	end
end

function event_trade(e)
	local item_lib = require('items');

	-- I'm hardcoding the helm returns here because the helm is in his quest loot list - Kalaylus
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29062, item2= 29062,item3 = 29062,item4 = 29062})) then -- 4 Giant Helms
		e.self:Say("Well done, "..e.other:GetName()..", the Dain is pleased with your efforts. With a few more brave allies like you, we'll soon be tearing down the halls of Kael Drakkel.");
		e.other:Faction(49, 50); --Coldain
		e.other:Faction(67, 50); --Dain
		e.other:Faction(179, -25); --King Tormax
		e.other:QuestReward(e.self, 0, 0, 0, 20, eq.ChooseRandom(30215,30219,30212,30263,0,0,0,0), 64000);
    elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 29062, item2 = 29062, item3 = 29062})) then -- less than 4 Giant Helms
		e.self:Say("'For storage reasons I'm afraid I can only accept four of these at once for the bounty.");
		e.other:SummonItem(29062)
		e.other:SummonItem(29062)
		e.other:SummonItem(29062)
    elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 29062, item2 = 29062})) then -- less than 4 Giant Helms
		e.self:Say("'For storage reasons I'm afraid I can only accept four of these at once for the bounty.");
		e.other:SummonItem(29062)
		e.other:SummonItem(29062)
    elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 29062})) then -- less than 4 Giant Helms
		e.self:Say("'For storage reasons I'm afraid I can only accept four of these at once for the bounty.");
		e.other:SummonItem(29062)
	elseif(item_lib.check_turn_in(e.self, e.trade,({item1 = 1199} or {item1 = 8895}))) then	
		--can be either shawl
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(129003)) then --Check if the Dain is up
			e.self:Say("The Dain has been waiting for you, show your shawl to him."); --Text made up
			e.other:SummonItem(8895);
		else -- Dain is not up
			e.other:SummonItem(8895);
			eq.spawn2(129003, 0, 0, 5.0, 769, 62, 130.0);
		end
	end

	item_lib.return_items(e.self, e.other, e.trade)		
		
end

function event_signal(e)
	if(e.signal == 1) then --Night
		e.self:Shout("The Royal Court of Dain Frostreaver the IV is now closed for the night. Those with official business for the crown may return in the morning.");
	elseif(e.signal == 2) then --Day
		e.self:Shout("The Royal Court of Dain Frostreaver IV and his council of advisors is now in session. Those citizens with official business for the crown please report to the throne room at this time.");
	end
end

