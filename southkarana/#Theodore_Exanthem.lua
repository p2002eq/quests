---- Quest:Interrogator's Badge (Badge #2)
-- QGlobal Helpers for Badge Quest #2 (qeynos_badge2)
-- 1 = Started Badge Quest #2 (Completed Quest #1 and turned in badge)
-- 2 = Handed an_interrogator the Briefing
-- 3 = Defeated Theodore
-- 4 = Spawned Morley and Markus
-- 5 = Theodores Confession
-- 6 = have the Interrogators Badge
-- Death of the an_investigator section will reset you back to QGlobal 1 so you can restart the escort portion

local trigger;

function event_spawn(e)
	eq.signal(14050,1,5000); -- an_interrogator
	trigger = 0;		--dialogue checkpoint
end

function event_say(e)
    if(e.message:findi("location") and trigger == 1) then
		e.self:Say("Fine, follow me creeps.");
		eq.move_to(-3098,-5872,94,160,true);
		eq.signal(14050,7,1);  --this calls for an interrogator to continue its waypoint. 
		trigger = 0;
	end
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("I think you've been breathing the air in the Northern Plains of Karana for too long. I will most certainly not tell you anything about their whereabouts, much less lead you right to them. You are not right in the head.");
		eq.move_to(-2750,-5465,00,192,true);
		eq.signal(14050,2,5000); -- an_interrogator
	elseif(e.signal == 2) then
		e.self:Say("What a joke! I'm not telling you a thing. You don't look like you could scare a moss snake. I'm not afraid of you!");
		eq.signal(14050,3,5000); -- an_interrogator
	elseif(e.signal == 3) then
		e.self:Emote("reels back, his eyes wide with shock. 'Ow,' he says nervously.");
		e.self:DoAnim(14);
		eq.signal(14050,4,5000); -- an_interrogator
	elseif(e.signal == 4) then
		e.self:Emote("winces and says, 'Oh. Yeah right. Like I'm afraid of that moron or something.' Theodore glances nervously over at you");
		eq.signal(14050,5,5000); -- an_interrogator
	elseif(e.signal == 5) then
		e.self:Emote("gulps nervously");
	elseif(e.signal == 6) then
		trigger = 1;	--sets dialogue checkpoint
	elseif(e.signal == 7) then
		e.self:Say("There... They are hiding out just down the hill here... Now release me!");
		eq.signal(14050,8,5000); -- an_interrogator
	end
end

function event_combat(e)
	if(e.joined == true) then
		eq.set_timer("defeat",500);
	end
end

function event_timer(e)
	if(e.timer == "defeat") then
		e.self:Say("Sweet father of rot, alright already! Stop hitting me and tell me what you want me to do!");
		eq.stop_timer("defeat");
		e.self:WipeHateList();
		eq.signal(14050,6,5000);  -- an_interrogator
        --eq.set_global("qeynos_badge2","3",5,"F"); -- Badge Globals
	end
end

function event_trade(e)
    local qglobals = eq.get_qglobals(e.self,e.other);
	local item_lib = require("items");
	if(tonumber(qglobals.qeynos_badge2) >= 2 and item_lib.check_turn_in(e.self, e.trade, {item1 = 2344})) then -- confession document
		e.self:Emote("makes a big X at the bottom of the document and hands it back saying, 'A bunch of worthless thugs is all you folks are!'");
		e.other:QuestReward(e.self,0,0,0,0,2395,1000); -- Theodore's Confession
        eq.set_global("qeynos_badge2","5",5,"F"); -- Badge Globals
		eq.signal(14050,9,5000);  -- an_interrogator
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
