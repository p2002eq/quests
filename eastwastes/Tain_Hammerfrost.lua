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
    flag == 0
    eq.set_timer("1", 60);
end

function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("The bloody Kromrif ambushed me! I escaped, but I am near death. They'll be tracking me down to finish me off at any moment. Without [help], I'm as good as dead.");

    elseif(e.message:findi("help") and flag == 0) then
        flag = 1;
        eq.set_timer("3", 600);
        e.self:Say("Thank Brell! I hear them approaching from just over that hill! Slay the leader, Ghrek, and give me his elixir.");
        entid1 = eq.spawn2(116560, 0, 0, -2991, -4837, 229, 65);
		entid2 = eq.spawn2(116030, 0, 0, -2991, -4815, 229, 65);
		entid3 = eq.spawn2(116030, 0, 0, -2991, -4793, 229, 65);
		entid4 = eq.spawn2(116030, 0, 0, -2991, -4859, 229, 65);
		entid5 = eq.spawn2(116030, 0, 0, -2991, -4881, 229, 65);
		mob1 = eq.get_entity_list():GetMobID(entid1);
		mob2 = eq.get_entity_list():GetMobID(entid2);
		mob3 = eq.get_entity_list():GetMobID(entid3);
        mob4 = eq.get_entity_list():GetMobID(entid4);
        mob5 = eq.get_entity_list():GetMobID(entid5);
        local mob1attack = mob1:CastToNPC();
		local mob2attack = mob2:CastToNPC();
		local mob3attack = mob3:CastToNPC();
		local mob4attack = mob4:CastToNPC();
		local mob5attack = mob5:CastToNPC();
		mob1attack:AddToHateList(npc, 1);
		mob2attack:AddToHateList(npc, 1);
		mob3attack:AddToHateList(npc, 1);
		mob4attack:AddToHateList(npc, 1);
		mob5attack:AddToHateList(npc, 1);



end




