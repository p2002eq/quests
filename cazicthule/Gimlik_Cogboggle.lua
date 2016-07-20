local encount1 = false;          -- have to keep track incase he hits same waypoint again
local encount2 = false;
local encount3 = false;
local encount4 = false;
local event = false;

function event_waypoint_arrive(e)
    if (e.wp == 12 and encount1 == false) then     -- encounter1
        encount1 = true;
        eq.spawn2(48073, 0, 0, e.self:GetX()+2, e.self:GetY()+2, e.self:GetZ(), 360-e.self:GetHeading());
        eq.spawn2(48073, 0, 0, e.self:GetX()-2, e.self:GetY()+2, e.self:GetZ(), 360-e.self:GetHeading());
	elseif (e.wp == 21 and encount2 == false) then     -- encounter2
		encount2 = true;
        eq.spawn2(48073, 0, 0, e.self:GetX()+2, e.self:GetY()+2, e.self:GetZ(), 360-e.self:GetHeading());
        eq.spawn2(48073, 0, 0, e.self:GetX()-2, e.self:GetY()+2, e.self:GetZ(), 360-e.self:GetHeading());
	elseif (e.wp == 30 and encount3 == false) then     -- encounter3
		encount3 = true;
        eq.spawn2(48073, 0, 0, e.self:GetX()+2, e.self:GetY()+2, e.self:GetZ(), 360-e.self:GetHeading());
        eq.spawn2(48073, 0, 0, e.self:GetX()-2, e.self:GetY()+2, e.self:GetZ(), 360-e.self:GetHeading());
	elseif (e.wp == 52 and encount4 == false) then     -- encounter4
		encount4 = true;
        eq.spawn2(48377, 0, 0, e.self:GetX()+2, e.self:GetY()+2, e.self:GetZ(), 360-e.self:GetHeading());	
		eq.set_timer("tracker",300000);
    end
end

function event_timer(e)
	if (e.timer == "tracker") then
		eq.stop_timer("tracker");
		local mob = eq.get_entity_list():GetMobByNpcTypeID(48377);
		if(mob) then		-- check to see if tracker is up so we know to despawn him or not.
			mob:CastToNPC():Depop();
		end
		e.self:Say("Fhew, we made it! Off I go!");
		e.self:CastSpell(36 ,48040);
		e.self:AssignWaypoints(113);
		encount1 = false;
		encount2 = false;
		encount3 = false;
		encount4 = false;
		event = false;
	elseif (e.timer == "gate") then
	    eq.stop_timer("gate");
		e.self:Say("Fhew, we made it! Off I go!");
		e.self:CastSpell(36 ,48040);
		e.self:AssignWaypoints(113);
		encount1 = false;
		encount2 = false;
		encount3 = false;
		encount4 = false;
		event = false;
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 8723})) then
		e.other:SummonItem(eq.ChooseRandom(8730,8728,8727,8729,8726));  -- random chance for reward out of the 5 items.
	end
end

function event_signal(e)
	if (e.signal == 1) then
		eq.stop_timer("tracker");
		eq.set_timer("gate",20000);
	end
end


function event_say(e)
    if (event == false) then
    	if(e.message:findi("hail")) then
    		e.self:Say("Well met, noble soul! I'm Gimlik Cogboggle. You are correct, the Gimlik Cogboggle, renowned adventurer, scholar, and yes... creator of spells. Please don't goggle or touch. Your opportunity has arrived, my friend. I was sent here to complete a very important task and for that, I will need some slight assistance. If you will be kind enough to follow me, I'll show you to your doom... err... get this show on the road. Just let me know when you're [ready].");
    	elseif (e.message:findi("ready")) then
    		e.self:AssignWaypoints(112);
    		e.self:Say("Alrighty, off we go!");
    		event = true;
    	end
    end
end


function event_death_complete(e)
	eq.spawn2(174184,0,0,586,1090,-90,132);
	eq.signal(174184,1);		-- send signal to keep track of respawn since database won't respawn gnome
end