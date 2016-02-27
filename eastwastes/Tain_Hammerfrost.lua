local entid1;
local entid2;
local entid3;
local entid4;
local entid5;
local mob1;
local mob2;
local mob3;
local mob4;
local mob5;



function event_spawn(e)
    flag = 0
    eq.set_timer("yell", 60000); -- 60 seconds
    e.self:DoAnim(16);
end

function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("The bloody Kromrif ambushed me! I escaped, but I am near death. They'll be tracking me down to finish me off at any moment. Without [help], I'm as good as dead.");

    elseif(e.message:findi("help") and flag == 0) then
        flag = 1;
        eq.set_timer("event", 600);
        e.self:Say("Thank Brell! I hear them approaching from just over that hill! Slay the leader, Ghrek, and give me his elixir.");
		eq.stop_timer("yell");

        entid1 = eq.spawn2(116604, 0, 0, -2991, -4837, 229, 65);
        entid2 = eq.spawn2(116532, 0, 0, -2991, -4815, 229, 65);
        entid3 = eq.spawn2(116532, 0, 0, -2991, -4793, 229, 65);
        entid4 = eq.spawn2(116532, 0, 0, -2991, -4859, 229, 65);
        entid5 = eq.spawn2(116532, 0, 0, -2991, -4881, 229, 65);

        mob1 = eq.get_entity_list():GetMobID(entid1);
        mob2 = eq.get_entity_list():GetMobID(entid2);
        mob3 = eq.get_entity_list():GetMobID(entid3);
        mob4 = eq.get_entity_list():GetMobID(entid4);
        mob5 = eq.get_entity_list():GetMobID(entid5);

    --    local mob1attack = mob1:CastToNPC();
    --    local mob2attack = mob2:CastToNPC();
    --    local mob3attack = mob3:CastToNPC();
    --    local mob4attack = mob4:CastToNPC();
    --    local mob5attack = mob5:CastToNPC();
    --    mob1attack:AddToHateList(npc, 1);
    --    mob2attack:AddToHateList(npc, 1);
    --    mob3attack:AddToHateList(npc, 1);
    --    mob4attack:AddToHateList(npc, 1);
    --    mob5attack:AddToHateList(npc, 1);

	--	mob1:SaveGuardSpot(0);
	--	mob2:SaveGuardSpot(0);
	--	mob3:SaveGuardSpot(0);
	--	mob4:SaveGuardSpot(0);
	--	mob5:SaveGuardSpot(0);

		mob1:MoveTo(-2681, -4944, 150);	
		mob2:MoveTo(-2703, -4920, 150);	
		mob3:MoveTo(-2697, -4890, 150);	
		mob4:MoveTo(-2707, -4950, 150);	
		mob5:MoveTo(-2710, -4949, 150);	
    end
end



function event_trade(e)

	local item_lib = require('items');

	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 30139})) then
		e.self:SetAppearance(3);
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 =  30138})) then	
	    e.self:Say("Test2");
			    e.self:Say("Test3");
		e.self:SetAppearance(0);
			    e.self:Say("Test4");
		e.self:Say("I will report your selfless actions when I return to Thurgadin. Take this for your troubles, friend. I hope you find it useful. Fare thee well.");
			    e.self:Say("Test5");
		e.other:Faction(49, 30);
		e.other:Faction(67, 30);
		e.other:Faction(188, -30);
		e.other:Faction(189, -30);
			    e.self:Say("Test6");
		e.other:QuestReward(e.self, 0,0,0,0, 30140, 80000);
			    e.self:Say("Test7");
		eq.depop_all(116005);
	end
end

function event_timer(e)
	if e.timer == 'yell' then
		e.self:SetAppearance(3);
		e.self:Say("Ohhhh, someone... help, please...");
	elseif (e.timer == 'depop') then
		eq.stop_timer("depop");
		eq.depop_with_timer();
	elseif (e.timer == 'event') then
		eq.stop_timer("event");
		flag = 0;
	end
end

function event_attack(e)
	e.self:SetAppearance(0); --in case he's attacked
end
