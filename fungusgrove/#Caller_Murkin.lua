-- #Caller_Murkin (157004) in Fungus grove 'Calling beasties' north cavern event caller

function event_spawn(e)
	started = false;
	wave_counter = 0;
	total_waves = 0;
end

function event_say(e)
	if e.message:findi("hail") then
		e.self:Say("Ho ho! You come to hunt beasties? I bet so, many o' you kinda people come to hunt beasties. I call beasties fer ya, yub yub. Werk hard, work cheap too yub. You wanna hunt beasties, you bring blargrot here yub! More [" .. eq.say_link("blargrot") .. "], me work harder yub.");
	elseif e.message:findi("blargrot") then
		e.self:Emote("grins and rubs his belly, 'Blargrot! Loves it, yub! You bring blargrot and me call beasties outta tha cave for ya, yub. Bring me a lil' jug, I call a few beasties. Bring a big ol' hruge jug, me call more beasties than ya ever see, yub!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if not started and item_lib.check_turn_in(e.self, e.trade, {item1 = 28700}) then -- Small Bottle of Blargrot
		spawn_timer = 180;
		start_event(e);
		
	elseif not started and item_lib.check_turn_in(e.self, e.trade, {item1 = 28701}) then -- Jug of Blargrot
		spawn_timer = 150;
		start_event(e);
		
	elseif not started and item_lib.check_turn_in(e.self, e.trade, {item1 = 28702}) then -- Huge Keg of Blargrot
		spawn_timer = 120;
		start_event(e);
		
	elseif started and item_lib.check_turn_in(e.self, e.trade, {item1 = 28703}) then -- North Caller Contract
		e.self:Emote("grunts and says, 'Oook! Tanks fer da werk, I see ya later!' before vanishing into the tunnel.");
		local exp_reward = total_waves * 50000;
		local cash_reward = total_waves * 10;
		e.other:QuestReward(e.self, math.random(50), math.random(50), math.random(50), cash_reward, 0, exp_reward);
		eq.stop_all_timers();
		eq.depop_with_timer();
	end
	
	item_lib.return_items(e.self, e.other, e.trade);
end

function event_timer(e)
	if e.timer == 'start_walk' then
		eq.stop_timer(e.timer);
		eq.start(1000);
	elseif e.timer == 'waves' then
		spawn_waves(e.self);
		if wave_counter == 1 then -- resets regular wave spacing
			eq.stop_timer(e.timer);
			eq.set_timer('waves', spawn_timer * 1000);
		elseif wave_counter > 4 then -- resets wave count and sets 5 minute pause between sets of waves
			e.self:Emote("wipes the sweat from his brow, 'aaaagh, tired tired. Hard werk. Take da sit uh huh. Me call more soon as me rest up.'");
			eq.stop_timer(e.timer);
			eq.set_timer('waves', 300 * 1000);
			wave_counter = 0;
		end
	end
end

function event_waypoint_arrive(e)
	if e.wp == 8 then
		e.self:ModifyNPCStat("runspeed","0");
		eq.set_timer('waves', 10 * 1000); -- 10 second pause after arriving at final position before waves start
	end
end

function spawn_waves(caller)
	caller:Emote("moans and waves his arms, then shouts 'Graka! Mootogo Ta Naga!'");
	for i=1,3 do
		-- pick whether mob will spawn outside or inside the cave
		local locs = {};
		if math.random(1,2) > 1.5 then
			locs = { math.random(-1115, -1080), math.random(1000, 1075), -380 };
		else
			locs = { math.random(-1180, -1050), math.random(660, 745), -330 };
		end
		-- pick mob identity
		local mob = 0;
		mob_picker = math.random(1000);
		if mob_picker <= 225 then
			mob = 157129; -- fungusbeast
		elseif mob_picker <= 450 then
			mob = 157121; -- fungusfiend
		elseif mob_picker <= 655 then
			mob = 157122; -- fungus healer
		elseif mob_picker <= 865 then
			mob = 157123; -- fungus priest
		elseif mob_picker <= 880 then
			mob = 157116; -- Chakizno
		elseif mob_picker <= 895 then
			mob = 157125; -- Turchako
		elseif mob_picker <= 910 then
			mob = 157117; -- Chakiza
		elseif mob_picker <= 925 then
			mob = 157118; -- Chakno
		elseif mob_picker <= 940 then
			mob = 157115; -- Chakta
		elseif mob_picker <= 955 then
			mob = 157120; -- Tochaka
		elseif mob_picker <= 970 then
			mob = 157127; -- Takacha
		elseif mob_picker <= 985 then
			mob = 157124; -- Tiako
		elseif mob_picker <= 1000 then
			mob = 157128; -- Tuchako
		end
		local newmob = eq.spawn2(mob, 0, 0, locs[1], locs[2], locs[3], 0);
		newmob:CastToNPC():MoveTo(-1098, 866, -332, 0, true);
		eq.set_timer('depop', 30 * 60 * 1000, newmob);
	end
	wave_counter = wave_counter + 1;
	total_waves = total_waves + 1;
end

function start_event(e)
	e.self:Say("Aieee! Beastie huntin' fer us! Le's go! You give me back da contrac when you had nuff beasties, yub. Me quit then, an' call no more beasties. I wait a minute so you make ready. Then ya follow me, and I take ya to da cave where we find beasties...");
	e.other:SummonItem(28703); -- North Caller Contract
	eq.set_timer('start_walk', 60000);
	started = true;
end
