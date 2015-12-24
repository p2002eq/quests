-- on eqemu prayer of brell is said to grand historian instead of in the area
-- I will change this on P2002 to where if the player is on that part of the quest
-- to be as accurate as possible to live

function event_spawn(e)
	eq.set_timer("lecture1", 110000);	
end

function event_say(e)
--omiting this part don't know quest text
end

function event_timer(e)
	if (e.timer == "lecture1") then
		e.self:Say("We are taught from day one that the truth lies underfoot. It is simple common sense then, that the taller a being is, the farther his mind and heart are from the truth. Always be wary of those larger in stature than us.");
		eq.signal(115028,8000);
		eq.signal(115197,8000);
		eq.signal(115025,16000);
		eq.signal(115194,16000);
		eq.stop_timer("lecture1")
		eq.set_timer("lecture2", 110000)
	elseif (e.timer == "lecture2") then
		e.self:Say("If we Coldain just work together, obeying Brell's teachings, nothing can stop us from overcoming our enemies. Even the Kromrif will fall before us if we are undivided. It is only when we stray from our fundamental knowledge that we are vulnerable.");
		eq.stop_timer("lecture2");
		eq.set_timer("lecture3", 110000);
	elseif (e.timer == "lecture3") then
		e.self:Say("Allow me to share a short story from my youth. It begins when I was just tail high to a snow bunny. Instead of tending to my studies, I snuck out and participated in what was then our 300th annual snowball fighting tournament. . .");
		eq.stop_timer("lecture3");
		eq.set_timer("lecture4", 70000);
	elseif (e.timer == "lecture4") then
		eq.signal(115022,1);
		eq.signal(115191,1);
		eq.signal(115021,8000);
		eq.signal(115022,2,8100);
		eq.signal(115191,2,8100);
		eq.stop_timer("lecture4");
		eq.set_timer("lecture5", 110000);
	elseif (e.timer == "lecture5") then
		e.self:Say("Young Doriggan, perhaps you will find it easier to focus on my words from a standing position. That corner will do fine.");
		eq.signal(115022,3);
		eq.signal(115191,3);
		eq.stop_timer("lecture5");
		eq.set_timer("lecture6", 110000);
	elseif (e.timer == "lecture6") then
		e.self:Say("I have an important announcement to make today. The Dain has heard rumor of a faction of our brethren who openly oppose the crown. If you come forth with any information leading to the discovery of any such traitorous vermin you will be richly rewarded. Their fate most certainly lies at the bottom of the well.");
		eq.stop_timer("lecture6");
		eq.set_timer("lecture1", 110000);
	end

end

function event_trade(e)

	local item_lib = require('items');

	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 1418, item2 = 1428})) then
		e.self:Say("My compliments, "..e.other:GetName()..", what a wonderful dish! Please accept my personal Seal as a token of my appreciation. May it give you power over your adversaries.");
		e.other:QuestReward(e.self, 0,0,0,0, 1422, 200000);
		e.other:Faction(49, 10); --coldain
		e.other:Faction(67, 10); --dain
		e.other:Faction(188, -30); --kromrif
		e.other:Faction(189, -30); --kromzek
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 =  1428})) then	
		e.self:Say("My compliments, "..e.other:GetName()..", what a wonderful dish!");
		e.other:AddEXP(5000);
		e.other:Faction(49, 10); --coldain
		e.other:Faction(67, 10); --dain
		e.other:Faction(188, -30); --kromrif
		e.other:Faction(189, -30); --kromzek
	end

	item_lib.return_items(e.self, e.other, e.trade);	

end
