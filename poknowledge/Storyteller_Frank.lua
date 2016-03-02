local started = false;

function event_timer(e)
	if (e.timer == "story1") then
	    eq.stop_timer("story1");
	    e.self:Say("1nd message");
	    eq.set_timer("story2", 20000);
	elseif (e.timer == "story2") then
	    eq.stop_timer("story2");
	    e.self:Say("2nd message");
	    eq.set_timer("story3", 20000);
	elseif (e.timer == "story3") then
	    eq.stop_timer("story3");
	    e.self:Say("3nd message");
	    eq.set_timer("story4", 20000);
	elseif (e.timer == "story4") then
	    eq.stop_timer("story4");
	    e.self:Say("4nd message");
	    eq.set_timer("story5", 20000);
	elseif (e.timer == "story5") then
	    eq.stop_timer("story5");
	    e.self:Say("5nd message");
	    eq.set_timer("story6", 20000);
	elseif (e.timer == "story6") then
	    eq.stop_timer("story6");
	    e.self:Say("6nd message");
	    eq.set_timer("story7", 20000);
	elseif (e.timer == "story7") then
	    eq.stop_timer("story7");
	    e.self:Say("7nd message");
	    eq.set_timer("story8", 20000);
	elseif (e.timer == "story8") then
	    eq.stop_timer("story8");
	    e.self:Say("8nd message");
	    eq.set_timer("story9", 20000);
	elseif (e.timer == "story9") then
	    eq.stop_timer("story9");
	    e.self:Say("9nd message");
	    eq.set_timer("story10", 20000);
	elseif (e.timer == "story10") then
	    eq.stop_timer("story10");
	    e.self:Say("10nd message");
	    eq.set_timer("story11", 20000);
	elseif (e.timer == "story11") then
	    eq.stop_timer("story11");
	    e.self:Say("11nd message");
	    eq.set_timer("story12", 20000);
	elseif (e.timer == "story12") then
	    eq.stop_timer("story12");
	    e.self:Say("12nd message");
	    eq.set_timer("story12", 20000);
	    started = false;
	end
end

function event_say(e)
	if(e.message:findi("Hail")) and (started == false) then
	    e.self:Say("Well, hello there Traveler, do you wish to hear the [story] of the Server?");
	elseif(e.message:findi("story")) and (started == false) then
	    e.self:Say("Stay awhile, this story will take some time.  It all started when a merry guild of Everquest fans found a server long ago called Al'Kabor.");
	    eq.set_timer("story1", 20000);
	    started = true;
	end
end