local started = false;

function event_timer(e)
	if (e.timer == "story1") then
	    eq.stop_timer("story1");
	    e.self:Say("It all started when a merry guild of Everquest fans found a server long ago called Al'Kabor.  This server was locked in time during the Age of Power...creating a tiny time capsule of a game gone by.  Ten years had passed since Al’Kabor had been time-locked, but the server was still unbeaten….the playerbase sparse and guarded against new intruders.    This Merry Guild saw it as a challenge, to progress through content, do what had never been done, conquer Al’Kabor!  Sadly, they never got the chance….the powers that be closed Al’Kabor.");
	    eq.set_timer("story2", 33000);
	elseif (e.timer == "story2") then
	    eq.stop_timer("story2");
	    e.self:Say("After the server closed The Merry Guild splintered off and went their own ways.  Years later Cocain contacted Fiddle and Boragar about a team attempting a resurrection of their beloved server.  The three devs got involved in various pieces of server development and had a vested interest in seeing Al’Kabor once again flourish.");
	    eq.set_timer("story3", 28000);
	elseif (e.timer == "story3") then
	    eq.stop_timer("story3");
	    e.self:Say("The Merry Guild was once again back together….Boragar, Cocain, Fiddle, Darkonites, Taian, Lance, and others proceeded to conquer Dragons and provide feedback to improve the fledgling server. A difference of opinions arose, and the merry guild was given a challenge.  If you don't like the server, then go make your own....");
	    eq.set_timer("story4", 28000);
	elseif (e.timer == "story4") then
	    eq.stop_timer("story4");
	    e.self:Say("And so they did!  Cocain coded all the back end and got the server up and running.  Darkonites provided the hosting.  Fiddle fixed many of the broken scripts.  Lance and Boragar cleaned up massive amounts of content from all of the fifty-four original zones.");
	    eq.set_timer("story5", 24000);
	elseif (e.timer == "story5") then
	    eq.stop_timer("story5");
	    e.self:Say("Then Boragar, Lance, and Fiddle began working on Kunark.  In three short months Kunark was completed and P2002 began to grow in numbers.  In October Lance parted ways with the team to take up conquering the injustices of the world full-time.  At that time the team gained three new members, Taian, Breezy, and Abscond.  Boragar crushed the database work with Breezy while Abscond, Cocain, Fiddle and Taian did all the quest work for Velious.");
	    eq.set_timer("story6", 26000);
	elseif (e.timer == "story6") then
	    eq.stop_timer("story6");
	    e.self:Say("Just in time for the holidays Velious was released.  The player population started growing at a rapid rate and things were taking off for P2002.  The team added Trust during this time and he began taking over many of Cocain’s responsibilities so that Cocain could run his real life empire.  This addition of Trust turned out to be key for the well being of the server.");
	    eq.set_timer("story8", 19000);
    elseif (e.timer == "story8") then
        eq.stop_timer(e.timer);
		e.self:Say("In early 2016 the server staff realized there would need to be a client change to address many of connection issues. For the next nine months Breezy, Trust, Taian, Cocain, and Boragar focused on making Titanium a reality.");
		eq.set_timer("story9",19000);
	elseif (e.timer == "story9") then
        eq.stop_timer(e.timer);
		e.self:Say("Six months after the release of Velious, Cazicthule, the zone and the God, as well as Innoruuk was released. This gave the raiding guilds multiple new targets and the every day player another zone to farm.");
		eq.set_timer("story10",16000);
	elseif (e.timer == "story10") then
        eq.stop_timer(e.timer);
		e.self:Say("In December of 2016 Titanium was launched and the players rejoiced. Lag was no longer the hardest raid encounter and also certain features were available with the new client.");
		eq.set_timer("story11",16000);	
    elseif (e.timer == "story11") then
        eq.stop_timer(e.timer);
		e.self:Say("After the new client was released, the staff realized to compensate for the large spike in population, the server needed an upgrade in hardware.  Using the generous donations from the players, in early 2017 the server was upgraded to one that can handle the rising population for years to come.");
		eq.set_timer("story12",20000);		
    elseif (e.timer == "story12") then
        eq.stop_timer(e.timer);
		e.self:Say("With all this going on, there was plenty of enjoyment from the casual players and the more seasoned raiders.  Powerslave continued to lead the server in end game raiding, but they were not alone.  Invictus had a quick rise and fall, while Noble Heroes gradually turned from a leveling guild to an end game raiding guild.  Many more guilds have popped up to compensate for the rising population.");
		eq.set_timer("story13",20000);
    elseif (e.timer == "story13") then
        eq.stop_timer(e.timer);
		e.self:Say("Throughout the fall and winter the staff focused on getting luclin ready.  Boragar, Kalaylus, Trust, Taian, and Thaco (and many others) worked on the large amount of content available in Luclin. With a team effort, p2002 was happy to announce Luclin to be launched April 14th of 2017!  Heres to another great year for p2002 and everyone who makes this server what it is.");
		eq.set_timer("story14",2000);			
	elseif (e.timer == "story14") then
        eq.stop_timer(e.timer);
        started = false;
	end
end

function event_say(e)
	if(e.message:findi("Hail")) and (started == false) then
	    e.self:Say("Well, hello there Traveler, do you wish to hear the [" .. eq.say_link("story") .. "] of the Server?");
	elseif(e.message:findi("story")) and (started == false) then
	    e.self:Say("Stay awhile, this story will take some time.");
	    eq.set_timer("story1", 8000);
	    started = true;
	end
end