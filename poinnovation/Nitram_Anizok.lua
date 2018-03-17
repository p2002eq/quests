local walking;
local won;
local counter;

function event_spawn(e)
	--clear variables
	walking = false
	won = false;
	counter = 0;
	eq.set_timer("dragon_check", 5 * 1000);
end


function event_say(e)
	if not walking then
		if e.message:findi("hail") then
			e.self:Say("Oh my hello! It has been such a long time since I have had visitors. Have you come to learn of [" .. eq.say_link("advanced tinkering") .. "] as well?");
		elseif e.message:findi("advanced tinkering") then
			e.self:Say("Aye, I advanced to this plane due to my work on tinkering back in Ak`Anon. A grand city it is, but my abilities were compromised with the materials I had to work with there. My body and soul has come to rest here, forever coming up with new ideas. You should be aware though that this plane is not how it was when I arrived. Much [" .. eq.say_link("construction") .. "] has taken place.");
		elseif e.message:findi("construction") then
			e.self:Say("When I first arrived I started creating smaller things. As time went on my inventions became more and more focused and impressive. I started building steam powered clockwork to help me gather materials. I had gone too far giving them the ability to learn and with a built in desire of self perpetuation. They began to integrate themselves with the clockwork that already existed within the factory that you can see if you step outside.");
			e.self:Say("I once worked within the factory with a kind and fair gnome, Meldrath. Now that he has gone missing the clockworks seem to be working towards a more devious goal. The clockwork out here in the junkyard have been discarded due to their malfunction or replacement by a more efficient series. Needless to say their [" .. eq.say_link("instinct for survival") .. "] has not been lost.");
		elseif e.message:findi("instinct for survival") then
			e.self:Say("The clockwork have become increasingly aggressive because of their desperation for spare parts. I have to defend myself anytime I head out to find parts for my tinkering. I fear for my safety with what is being built in the factory. I have started to build myself my own means of defense. It is nearly completed but I need an odd [" .. eq.say_link("combination of batteries") .. "] to start it up. I should have planned more carefully for it to use simple mana batteries.");
		elseif e.message:findi("combination of batteries") then	
			e.self:Say("Well you see when I was back home it was common for me to use a mycological spore extricate-kinetoconvertor to power my devices. I started planning my defense to use this as a power source out of sheer habit. Here in this desolation the mushrooms that were grown back home do not exist. I am going to have to rig something from spare parts. It is taking a long time with my having to search the junkyard small portions at a time due to the clockworks. Would you help me in [" .. eq.say_link("collecting materials") .. "]?");
		elseif e.message:findi("collecting materials") then	
			e.self:Say("Let us see here. I have some of the base parts for the power source. If you could collect a copper node, a bundle of super conductive wires, and an intact power cell I could power up the machine. Good luck to you $name, I hope that we can work together on this.");
		end
	elseif won then
		if e.message:findi("hail") then
			local qglobals = eq.get_qglobals(e.self, e.other);
			e.self:Say("Whew that was a close one!  I shall have to study these schematics and see where I went wrong.  Maybe if I build a new one that uses the correct kind of power source it would work better!  Anyhow, why don't you stop these beasts at the source?  If you go up to the main factory door and twist the very bottom rivet of the icon three times to the right, it will open.  I doubt they have changed how this works.  Good luck!");
			if qglobals.pop_poi_dragon == nil and counter < 72 then
				eq.set_global("pop_poi_dragon", "1", 5, "F");
				e.other:Message(15,"You receive a character flag!");
				counter = counter + 1;
			end
		end
	end
end

function event_trade(e)
    local item_lib = require("items");	
	
    if(not walking and item_lib.check_turn_in(e.self, e.trade, {item1 = 9426, item2 = 9295, item3 = 9434})) then  --Bundle of Super Conductive Wires, Copper Node, Intact Power Cell
		e.self:Say("Excellent!  This is wonderful, please follow me!  I will show you the power of my greatest invention.");
		walking = true;
		won = false;
		eq.start(23);
		eq.set_timer("loc", 1);	
	end
	
    item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	if e.timer == "loc" and e.self:GetX() == -720 and e.self:GetY() == 1500 and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(206067) then
		e.self:Emote("places the power unit right into the chest of the huge metallic beast.  It roars to life, steam pouring out of its gaping metallic maw.  Suddenly, it attacks! Nitram screams, 'Malfunction!  There is an error in its recognization process!  Help me to stop it before it destroys us all!'");
		eq.unique_spawn(206067,0,0,-735,1580,-50,251.6); --real Xanamech
		eq.depop(206068); --fake Xanamech
		eq.stop_timer(e.timer);
		eq.set_timer("win_check",2*1000);
		eq.set_timer("depop",2*60*60*1000); --fail timer 2hrs
	elseif e.timer == "win_check" and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(206067) then	--check for death
		eq.stop_timer(e.timer);
		eq.stop_timer("depop");
		won = true;
		counter = 0;  --flag counter
		eq.set_timer("depop", 10 * 60 * 1000)  --10 min depop
	elseif e.timer == "depop" then
		eq.stop_timer(e.timer);
		eq.depop_all(206067);	--depops real Xanamech if failed
		eq.depop_with_timer();
	elseif e.timer == "dragon_check" then --check xanamech	
		eq.stop_timer(e.timer);
		if eq.get_entity_list():IsMobSpawnedByNpcTypeID(206067) then
			eq.depop(206067);	--depop real Xanamech
		end
		if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(206068) then
			eq.unique_spawn(206068,0,0,-735,1580,-50,251.6); --fake Xanamech
		end
	end
end

