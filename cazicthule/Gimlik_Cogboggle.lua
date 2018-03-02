-- Gimlik Cogboggle for CT 'gnome walk'

function event_spawn(e)
	tracker = 0;          -- tracking of event progress
	encount2 = false;
	encount3 = false;
	encount4 = false;
	trade = true;
	event = false;
end

function event_waypoint_arrive(e)
    if (e.wp == 10 and tracker < 1) then     -- encounter1
        tracker = 1;
		e.self:Say("Well look at this thing! A splendid example of a Tae Ew sacrificial death mask or something. At first glance, this thing looked like beautifully carved wood, but alas it is just skin.");
		eq.set_timer('adds', math.random(30) * 1000);
	elseif (e.wp == 23 and tracker == 1) then     -- encounter2
		tracker = 2;
		e.self:Say("My map is paying off. This mask is just where they said it would be. Just give me a minute to scribble this down and we'll continue. Please continue to scan the room. I'll feel much better if you're eaten first... err... if you watch my back.");
        eq.set_timer('adds', math.random(30) * 1000);
	elseif (e.wp == 37 and  tracker == 2) then     -- encounter3
		tracker = 3;
		e.self:Say("Well, that was a nice little trek. Take a breather while I note this area in my journal. I know that you must be tired. I haven't seen a head as large as yours in quite some time. Lean it against the wall or something. We'll need to leave in a moment.")
        eq.set_timer('adds', math.random(30) * 1000);
	elseif (e.wp == 50 and  tracker == 3) then     -- encounter4
		tracker = 4;
		e.self:Say("Oh joy, there's nothing down this hallway. That will teach me to follow you again. Let me look at my map and see if I can undo your handy work. One moment please. Shheeesh!")
        eq.set_timer('adds', math.random(30) * 1000);
	elseif (e.wp == 67 and tracker == 4) then     -- BOSS
		tracker = 5;
        local boss = eq.spawn2(48377,0.0, 0, e.self:GetX()+5, e.self:GetY()+5, e.self:GetZ(), 0); -- a Thul Tae Ew Tracker
		this_spawn:AddToHateList(eq.get_entity_list():GetMobByNpcTypeID(48040), 1); -- Gimlik Cogboggle
		eq.set_timer('depop', 60 * 60 * 1000, this_spawn); -- 60 Minute
		e.self:Say("Ack ack ack! Eat them not me!");
	elseif (e.wp == 76 and tracker == 5) then	-- returned to pyramid
		e.self:Say("Well, here we are. See, you didn't even have to break a sweat. I'm all ready to... hmm... wait, I seem to have dropped my favorite quill. Did you pick it up by chance? I'll add a little something to your payment if you did.");
		trade = true;
    end
end

function event_timer(e)
	if e.timer == 'adds' then
		eq.stop_timer(e.timer);
		spawn_adds(e.self);
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if trade and item_lib.check_turn_in(e.self, e.trade, {item1 = 8723}) then -- A Tiny Metal Quill
		e.other:QuestReward(e.self,0,0,0,math.random(50),eq.ChooseRandom(8730,8728,8727,8729,8726),250000); -- Cogboggles Clockwork Contraption, Iron Cog Earring, Rough Steel Cog Earring, Shiny Cog Earring or Tiny Gear Shaped Earring
		e.self:Emote("begins to cast a spell. Gimlik says, 'Well, you've got a good eye on you for being so daft. Thank you for returning my quill. Take care!' Gimlik gates.");
		eq.depop_with_timer();
	end
	
	item_lib.return_items(e.self, e.other, e.trade);
end

function event_say(e)
	if not event then
		if e.message:findi("hail") then
			e.self:Say("Well met, noble soul! I'm Gimlik Cogboggle. You are correct, the Gimlik Cogboggle, renowned adventurer, scholar, and yes... creator of spells. Please don't goggle or touch. Your opportunity has arrived, my friend. I was sent here to complete a very important task and for that, I will need some slight assistance. If you will be kind enough to follow me, I'll show you to your doom... err... get this show on the road. Just let me know when you're [" .. eq.say_link("ready") .. "].");
		elseif e.message:findi("ready") then
			e.self:SetNPCFactionID(1006);
			e.self:AssignWaypoints(151);
			e.self:Say("Well look at you! You see, you're off to a great start! Now, just follow me and yell out if something stabs you or maims you in anyway. Never fear, I've memorized gate and have complete confidence in your ability to fend off danger for at least five seconds. Follow me... follow me.");
			event = true;
			trade = false;
		end
	elseif trade then
		e.self:Say("Well? Did you manage to find my quill?");
	else
		e.self:Say("Can't you see I'm busy right now!?");
	end
end

function event_death_complete(e)
	if tracker < 2 then eq.get_entity_list():GetSpawnByID(326935):Repop(); end
end

function spawn_adds(e_self)
	local gnome = eq.get_entity_list():GetMobByNpcTypeID(48040); -- Gimlik Cogboggle
	local spawnNum = math.random(2, 4);
	for i = 1, spawnNum do
		local spawnID = eq.ChooseRandom(48397, 48058, 48058, 48116); -- a Thul Tae Ew hunter (25%), a Tae Ew warrior (50%) or a jungle hunter (25%)
		local xloc = e_self:GetX() + math.random(-5, 5);
		local yloc = e_self:GetY() + math.random(-5, 5);
		local this_spawn = eq.spawn2(spawnID,0.0, 0, xloc, yloc, e_self:GetZ(), 0);
		this_spawn:AddToHateList(gnome, 1);
		eq.set_timer('depop', 60 * 60 * 1000, this_spawn); -- 60 Minutes
	end
end
