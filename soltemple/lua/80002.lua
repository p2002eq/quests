local engaged =  0;

function event_spawn(e)
	if((zonehour < 9) or (zonehour > 21)) then --9AM to 9PM
		eq.depop_with_timer();
	else
		eq.set_timer("seeker_depop", 30000);
	end
end
--80041
function event_combat(e)
	if(e.joined) then
		engaged = 1;
	else
		engaged = 0;
	end
end

function event_timer(e)
	if(not engaged and ((zonehour < 9) or (zonehour > 21))) then
		eq.stop_timer("seeker_depop");
		eq.depop_with_timer();
	end
end

function event_death_complete(e)
	eq.stop_timer("seeker_depop");
end

function event_say(e)
	if(e.message:findi("solusek ro")) then
		e.self:Say("Solusek Ro is the Master of Fire and the Keeper of Power.");
	elseif(e.message:findi("plasmatic priest")) then
		e.self:Say("You speak of things that should not be spoken! It would be in your best interest to leave this temple at once and return to lands less consumed by flame!");
	end
end

function event_trade(e)
local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 28051})) then --Coral Statue of Tarew
		e.self:Emote("shakes violently as his hand closes on the coral statue and flames dance in the depths of his eyes! The statue begins to emit a reddish glow then shatters in a burst of fire and smoke! The flames in the plasmatic priest's eyes vanish with the explosion and only madness remains!");
		e.self:Say("The Triumvirate thinks that destroying my spirit of flame will stop me?!! I will kill you all now, the goblins will continue to war, and when my spirit is restored I will ensure that Ixiblat Fer consumes all of Norrath in his flames!!");
		local priest = eq.spawn2(80042,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),0); --a_plasmatic_priest
		local attack = eq.get_entity_list():GetMobID(priest);
		local priestattack = attack:CastToNPC();
		priestattack:AddToHateList(e.other, 1);
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
