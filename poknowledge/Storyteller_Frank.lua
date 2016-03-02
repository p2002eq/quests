local started = false;

function event_timer(e)
	if (e.timer == "story1") then
	    eq.stop_timer("story1");
	    e.self:Say("It all started when a merry guild of Everquest fans found a server long ago called Al'Kabor.  This server was locked in time during the Age of Power...creating a tiny time capsule of a game gone by.  Ten years had passed since Al’Kabor had been time-locked, but the server was still unbeaten….the playerbase sparse and guarded against new intruders.    This Merry Guild saw it as a challenge, to progress through content, do what had never been done, conquer Al’Kabor!  Sadly, they never got the chance….the powers that be closed Al’Kabor.");
	    eq.set_timer("story2", 10000);
	elseif (e.timer == "story2") then
	    eq.stop_timer("story2");
	    e.self:Say("After the server closed The Merry Guild splintered off and went their own ways.  Years later Cocain contacted Fiddle and Boragar about a team attempting a resurrection of their beloved server.  The three devs got involved in various piece of server development and had a vested interest in seeing Al’Kabor once again flourish.");
	    eq.set_timer("story3", 10000);
	elseif (e.timer == "story3") then
	    eq.stop_timer("story3");
	    e.self:Say("The Merry Guild was once again back together….Boragar, Cocain, Fiddle, Darkonites, Taian, Lance, and others proceeded to conquer Dragons and provide feedback to improve the fledgling server.  Shortly after the server launched it became very evident this new Al’Kabor was turning out to be nothing like the old Al’Kabor was.  A difference of opinions arose, and the merry guild was given a challenge.  If you don't like the server, then go make your own!");
	    eq.set_timer("story4", 10000);
	elseif (e.timer == "story4") then
	    eq.stop_timer("story4");
	    e.self:Say("So…..they did.  Cocain coded all the back end and got the server up and running.  Darkonites provided the hosting.  Fiddle fixed many of the broken scripts.  Lance and Boragar cleaned up massive amounts of content from all of the fifty-four original zones.");
	    eq.set_timer("story5", 10000);
	elseif (e.timer == "story5") then
	    eq.stop_timer("story5");
	    e.self:Say("5nd message");
	    eq.set_timer("story6", 10000);
	elseif (e.timer == "story6") then
	    eq.stop_timer("story6");
	    e.self:Say("6nd message");
	    eq.set_timer("story7", 10000);
	elseif (e.timer == "story7") then
	    eq.stop_timer("story7");
	    e.self:Say("7nd message");
	    eq.set_timer("story8", 10000);
	elseif (e.timer == "story8") then
	    eq.stop_timer("story8");
	    e.self:Say("8nd message");
	    eq.set_timer("story9", 10000);
	elseif (e.timer == "story9") then
	    eq.stop_timer("story9");
	    e.self:Say("9nd message");
	    eq.set_timer("story10", 10000);
	elseif (e.timer == "story10") then
	    eq.stop_timer("story10");
	    e.self:Say("10nd message");
	    eq.set_timer("story11", 10000);
	elseif (e.timer == "story11") then
	    eq.stop_timer("story11");
	    e.self:Say("11nd message");
	    eq.set_timer("story12", 10000);
	elseif (e.timer == "story12") then
	    eq.stop_timer("story12");
	    e.self:Say("12nd message");
	    --eq.set_timer("story13", 10000);
	    started = false;
	end
end

function event_say(e)
	if(e.message:findi("Hail")) and (started == false) then
	    e.self:Say("Well, hello there Traveler, do you wish to hear the [story] of the Server?");
	elseif(e.message:findi("story")) and (started == false) then
	    e.self:Say("Stay awhile, this story will take some time.");
	    eq.set_timer("story1", 5000);
	    started = true;
	end
end