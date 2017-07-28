-- Scout_Husman (167203) in Grimling for BST epic

function event_spawn(e)
    at_camp = false;
end

function event_say(e)
    if e.message:findi("hail") then
        e.self:Say("Greetings, " .. e.other:GetName() .. ". Are you [" .. eq.say_link("here to help") .. "]? You've no doubt heard of the issues with the Grimlings throughout the forest. I fear we may not be able to push them back enough this time to keep our people safe from the dastardly deeds of those vile things. Reports have come in that they may be trying to come at us from the North. While it wouldn't be unheard of, such a move might prove to be a decoy for other attacks coming from the West.");
    elseif e.message:findi("here to help") then
        e.self:Say("I'm glad to hear it. From our reports, they have a rather small group of soldiers North of here, comprising of two encampments not far from each other. We must begin pushing the Grimlings back to their mines so they cannot continue to have a stronghold in this area. For now, you must gather together a group of soldiers to venture with you to help us clear one of the camps out. When you are [" .. eq.say_link("ready to go") .. "], inform me of such and I will lead you to the camp where you can make preparations for battle.");
    elseif e.message:findi("ready to go") then
        e.self:Say("Right, then. We'll be making our way to, what we believe, is their number one camp, leading the way for the other camp northward down to us. Make sure you have everyone with you, we'll be making our way to the camp in just a minute.");
        eq.set_timer('start', 60 * 1000); -- waits 1 minute then paths to grimling camp
    elseif at_camp and e.message:findi("ready to start") then
        e.self:Say("Now is the time, my friends, to prove yourselves in the thick of battle! Charge to the enemy and leave no Grimling standing!");
        eq.unique_spawn(167716,0,0,-1247,535,40, 110); -- untargetable Ukigit
    end
end

function event_waypoint_arrive(e)
    if e.wp >= 13 and not at_camp then
        at_camp = true;
        e.self:Say("Here we are, at their primary camp to the direct North of our outpost. It is up to you to clear the camp of these worrisome Grimlings so we can help to push them back into those wretched mines. They'll likely use the hills behind those huts as cover for their casters, but be sure to clear out those in the huts first, as they will no doubt be more trouble than you are expecting. Also, watch out for any officers, as they can cause more problems still if you're not careful. When you are [" .. eq.say_link("ready to start") .. "], let me know and I will let you loose to wreak havoc on the Grimlings of that camp.");
    end
end

function event_timer(e)
    if e.timer == 'start' then
        eq.start(11);
    end
end