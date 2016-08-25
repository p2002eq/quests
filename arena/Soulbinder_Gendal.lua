-- Converted to .lua by Speedz
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings " .. e.other:GetName() .. ". When a hero of our world is slain their soul returns to the place it was last bound and the body is reincarnated. As a member of the Order of Eternity  it is my duty to [bind your soul] to this location if that is your wish.");
    	e.self:Say("Or if you would like to travel to the plane of knowledge, just say [knowledge].");
	elseif(e.message:findi("bind my soul")) then
		e.self:Say("Binding your soul. You will return here when you die.");
		e.self:CastSpell(2049,e.other:GetID(),0,1);
	elseif(e.message:findi("knowledge")) then	
		e.other:MovePC(202, -52, -210, -151.6, 126);
	elseif(e.message:findi("timers")) then
		eq.set_timer("memwipe",60000);
		eq.set_timer("heal",1000);
	elseif(e.message:findi("timersoff")) then
		eq.stop_timer("heal");
		eq.stop_timer("memwipe");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	if(e.timer == "heal") then
		local player_list = eq.get_entity_list():GetClientList();
		if(player_list ~= nil) then
			for player in player_list.entries do	
				player:Heal();
			end
		end
		eq.stop_timer("heal");
		eq.set_timer("heal",1000)
	elseif(e.timer == "memwipe") then
		local npc_list = eq.get_entity_list():GetNPCList();
		if(npc_list ~= nil) then
			for npc in npc_list.entries do	
				npc:WipeHateList();
			end
		end
		eq.stop_timer("memwipe");
		eq.set_timer("memwipe",60000);
	end
end