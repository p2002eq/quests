local battleStarted = false;    -- keep track, should only be able to have rygorr chief head turned in, if it's the battle version of him(using same npcid)
local waypoint2 = false;
local waypoint3 = false;

function event_spawn(e)
	battleStarted = false;
	waypoint2 = false;
	waypoint3 = false;
end

function event_say(e)
	
	-- Ring 1 Quest
	if(e.message:findi("hail")) then
		e.self:Say("Hrmff, what's this? A spy sent from the giant heathens, or the selfrighteous wurms perhaps? Either way, you'd be no [" .. eq.say_link("friend") .. "] of the great Coldain.");
	elseif(e.message:findi("friend")) then
		e.self:Say("A friend, you say? That remains to be seen. Much more to being a friend of the Coldain than just sayin' so. Anyway, I'm too [" .. eq.say_link("tired") .. "] to argue about it. I haven't slept in days.");
	elseif(e.message:findi("tired")) then
		e.self:Say("Did I say tired? Exhausted is more like it. Ever since that blizzard last week I haven't slept a wink. I came back from huntin' snow orcs to find that my [" .. eq.say_link("blanket") .. "] had blown away and now I'm just too tired to rustle up a new one.");
	elseif(e.message:findi("blanket")) then
		e.self:Say("Not just any old blanket, mind ye, mine was made of the finest tundra kodiak hides and snow panther skins, two of each. When I was wrapped up in it ya couldn't see me a bit, no, I blended right into the snow, I did. Say, if you be a friend, here's yer chance to prove it. Sew me up a new blanket so I can get some rest.");
	
	-- Ring 2 Quest
	elseif(e.message:findi("nephew")) then
		e.self:Say("My nephew, Boridain, keeps running away from home to kill a bothersome [" .. eq.say_link("beast") .. "], thinking this will prove to all of Thurgadin that he is a great hunter. Every time he does this my sister gets hysterical and I am sent out to find him.");
	elseif(e.message:findi("beast")) then
		e.self:Say("A rabid tundra kodiak has been feeding on our people for weeks now. If Boridain ever stumbled across the critter I doubt he'd stand a chance. I have a solution, but it would require the [" .. eq.say_link("assistance") .. "] of an outsider.");
	elseif(e.message:findi("assistance")) then
		e.self:Say("I'm taking a liking to you, stranger. Your eagerness to help us will not go unnoticed. Find my nephew and give him this axe. It should keep him from hurting himself. Return to me with the ring and proof that he is safe.");
	    e.other:QuestReward(e.self,0,0,0,0,30265);
	
	-- Ring 3 Quest
	elseif(e.message:findi("hunting")) then
		e.self:Say("My camp here boasts the most proficient hunters in the recorded history of the mighty Coldain empire. We alone could feed an entire clan. Things have been frustratingly [" .. eq.say_link("slow") .. "] lately, though.");
	elseif(e.message:findi("slow")) then
		e.self:Say("After years of skinning the hides of the giantmen, my hunting knife has lost its edge. The dull blade has slowed me down considerably. It has served me well, but a new [" .. eq.say_link("knife") .. "] would make me a much more proficient hunter.");
	elseif(e.message:findi("knife")) then
		e.self:Say("Hunt a wooly rhino and take his horn, then take a flawless hide from a walrus. Combine them in a forge with a skinning rock and bring me the new knife and the silver insignia ring.");
	
	-- Ring 4 Quest
	elseif(e.message:findi("smithing hammer")) then
		e.self:Say("[" .. eq.say_link("Tain") .. "] Hammerfrost can get you one. Find him and give him this.");
	    e.other:QuestReward(e.self,0,0,0,0,30139);
	elseif(e.message:findi("tain")) then
		e.self:Say("Tain left a short time ago, he said he had a score to settle with a particular Kromriff.");
		
	-- Ring 5 Quest
	elseif(e.message:findi("plans")) then
		e.self:Say("The bloody Ry'Gorr, friends of the frost giants, plan to raid our encampment. Their captain, Scarbrow Ga'hruk is leading the raid. I need someone to intercept his [" .. eq.say_link("orders") .. "] so we may prepare for the attack. Without them we could be in serious trouble.");
	   
	elseif(e.message:findi("orders")) then
		e.self:Say("Find the Ry'Gorr messenger and cut him down. Bring the message he carries to my lookout. When the attack is thwarted, return to me with the head of Scarbrow and the platinum insignia ring.");
  
	-- Ring 6 Quest
	elseif(e.message:findi("favor")) then
		e.self:Say("For several seasons there has been an unsolved mystery in this land. Not far from here an elite team of Coldain and their trained wolves were gathered to make a strike at the Kromrif. No one knows just what became of our strike force. Bring me proof of their fate and proof that whoever was responsible for their loss is no more.");
  
  
    -- Ring 7 Quest
	elseif(e.message:findi("mission")) then
		e.self:Say("A Coldain... A very important Coldain, has been abducted by the Rygorr. He was gathering information that is imperative to our victory over the brainless heathens. You must find him before he is killed and escort him to safety. Return to me with proof that Corbin Blackwell is safe.");
	   
    -- Ring 8 Quest
	elseif(e.message:findi("ready")) then
		e.self:Say("Very well, " .. e.other:GetName() .. ", give me the Adamantite ring and I will give you the marching orders. Once the orders are given to Gloradin in the next hut, we will be underway. You then must follow me to what will be our battleground. I must warn you, I will hold your ring until the head of Chief Ry`gorr is given to me. If we fail, all will be lost... for both of us.");
	   
	end

end
	
function event_waypoint_arrive(e)
    if (e.wp == 2 and waypoint2 == false) then 	
		waypoint2 = true;
	    e.self:Say("TROOPS! FALL IN!");
		eq.set_timer("emote7",5000);
	elseif (e.wp == 3 and waypoint3 == false) then
		waypoint3 = true;
		e.self:Say("It is worse than I thought. Not only are they prepared for an attack, but they have the Kromrif here to help them. Our steel will be tested today. Be sure not to show the troops any fear.");
		eq.set_timer("charge",90000);
	end
end

function event_waypoint_depart(e)
	if (e.wp == 2) then
		e.self:Say("Fall out men!");
		eq.set_timer("emote11",8000);
		eq.signal(116549,1);        -- signal paladins
		eq.signal(116541,1);        -- signal priests
		eq.signal(116555,1);        -- signal archers
		eq.signal(116563,1);        -- signal wolves	
	end
end
	
function event_trade(e)
	local item_lib = require("items");	
	-- Ring 1 Reward
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30135})) then
		e.self:Say("Ahh, that'll do fine. Take this, it is but a trinket for now, but continue to serve the Coldain and it will grow in power. I must get some rest now, for I have been told my [" .. eq.say_link("nephew") .. "] has disappeared again and I will need to track him down tomorrow.");
        e.other:QuestReward(e.self,0,0,0,0,30131,50000);
		e.other:Faction(49, 30); -- +Coldain
		e.other:Faction(67, 30); -- +Dain Frostreaver IV
		e.other:Faction(188, -30); -- -Kromrif
		e.other:Faction(189, -30); -- -Kromzek
		
	-- Ring 2 Reward
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30267, item2 = 30131})) then
	    e.self:Say("Well done friend! My nephew is safe at home and his thirst for adventure is quenched for now. The beast will claim no more of our people. I couldn't have handled it better myself. Now I can get back to the business of [" .. eq.say_link("hunting") .. "].");
        e.other:QuestReward(e.self,0,0,0,0,30133,60000);
		e.other:Faction(49, 30); -- +Coldain
		e.other:Faction(67, 30); -- +Dain Frostreaver IV
		e.other:Faction(188, -30); -- -Kromrif
		e.other:Faction(189, -30); -- -Kromzek
	
	-- Ring 3 Reward
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30133, item2 = 30137})) then
	    e.self:Say("Hrmm, not quite the work of a Coldain. Barely functional, in fact. I'll be needing to touch this up a bit. Fetch me a Coldain [" .. eq.say_link("smithing hammer") .. "] and I'll be sure to tell my associates in Thurgadin of your deeds.");
        e.other:QuestReward(e.self,0,0,0,0,30132,70000);
		e.other:Faction(49, 30); -- +Coldain
		e.other:Faction(67, 30); -- +Dain Frostreaver IV
		e.other:Faction(188, -30); -- -Kromrif
		e.other:Faction(189, -30); -- -Kromzek
	
	-- Ring 4 Reward
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30140, item2 = 30132})) then
	    e.self:Say("Ahh, there we go now, that's more like it. It would be time to return to the hunt were it not for the [" .. eq.say_link("plans") .. "] our spies have discovered.");
        e.other:QuestReward(e.self,0,0,0,0,30134,80000);
		e.other:Faction(49, 30); -- +Coldain
		e.other:Faction(67, 30); -- +Dain Frostreaver IV
		e.other:Faction(188, -30); -- -Kromrif
		e.other:Faction(189, -30); -- -Kromzek
		
	-- Ring 5 Reward
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30141, item2 = 30134})) then
	    e.self:Say("Without your assistance, we would have lost our camp and our lives. Again, I thank you. Now that you have proven your loyalty to the throne I have a special [" .. eq.say_link("favor") .. "] to ask of you.");
        e.other:QuestReward(e.self,0,0,0,0,30268,90000);
		e.other:Faction(49, 30); -- +Coldain
		e.other:Faction(67, 30); -- +Dain Frostreaver IV
		e.other:Faction(188, -30); -- -Kromrif
		e.other:Faction(189, -30); -- -Kromzek
		
	-- Ring 6 Reward
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1045, item2 = 18084, item3 = 30268})) then
	    e.self:Say("lowers his head and mutters, 'At least there will be some closure for their families, thanks to you. The Ry`gorr will pay for this with their lives! I will ask you to help us in the invasion of Ry`gorr keep, but first I have a delicate [" .. eq.say_link("mission") .. "] I was hoping you'd handle.");
        e.other:QuestReward(e.self,0,0,0,0,30162,100000);
		e.other:Faction(49, 30); -- +Coldain
		e.other:Faction(67, 30); -- +Dain Frostreaver IV
		e.other:Faction(188, -30); -- -Kromrif
		e.other:Faction(189, -30); -- -Kromzek
		
	-- Ring 7 Reward
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1047})) then
	    e.self:Say("Thank you, your service to our people has been most helpful. The time has come for our people to make war with the Ry`gorr. They must pay for their transgressions against our people. We are just waiting on you. Prepare yourself for glorious battle and tell me when you are [" .. eq.say_link("ready") .. "].");
        e.other:QuestReward(e.self,0,0,0,0,30163,110000);
		e.other:Faction(49, 30); -- +Coldain
		e.other:Faction(67, 30); -- +Dain Frostreaver IV
		e.other:Faction(188, -30); -- -Kromrif
		e.other:Faction(189, -30); -- -Kromzek	
		
	-- Ring 8 Reward
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30163})) then
	    e.self:Say("Give this to Gloradin and return to me immediately, it is time. May Brell be with us!");
        e.other:QuestReward(e.self,0,0,0,0,1093,120000);
		e.other:Faction(49, 30); -- +Coldain
		e.other:Faction(67, 30); -- +Dain Frostreaver IV
		e.other:Faction(188, -30); -- -Kromrif
		e.other:Faction(189, -30); -- -Kromzek
		
	-- Rygorr head after battle, can only turn it into the version for the battle (he can't die).
	elseif battleStarted and item_lib.check_turn_in(e.self, e.trade, {item1 = 1092}) then    
	    e.self:Say("Good work friend! The Dain will hear of this right away. We couldn't have defeated the Ry'gorr without your help. Take this ring as proof that you have served the Coldain well. You may wish to show it to the Seneschal should you ever stop in our fine city. Farewell, " ..e.other:GetName().. ", it has been my pleasure knowing you."); 
	    e.other:QuestReward(e.self,0,0,0,0,30164,120000);
	   	e.other:Faction(49, 30); -- +Coldain
		e.other:Faction(67, 30); -- +Dain Frostreaver IV
		e.other:Faction(188, -30); -- -Kromrif
		e.other:Faction(189, -30); -- -Kromzek
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

function event_signal(e)
    if (e.signal == 10) then
		battleStarted = true;
        e.self:AssignWaypoints(277);
		eq.set_timer("emote1",6000);
    end
end

function event_timer(e)
	if (e.timer == "emote1") then
		e.self:Say("Follow me closely, friend, time is of the essence. I will describe our situation as we walk.");
		eq.set_timer("emote2",10000);
	elseif (e.timer == "emote2") then
		event_emote(e,"Your pulse quickens in anticipation of battle!");
		eq.set_timer("emote3",8000);
	elseif (e.timer == "emote3") then
		e.self:Say("The Dain's own royal troops will be at our disposal for the battle. This is good news, they are hardened, experienced soldiers. The bad news is that our sources indicate that the Ry`gorr have been alerted to our presence and will be ready for an attack. This is most unfortunate... They will not go down without a fierce fight.");
		eq.set_timer("emote4",18000);
	elseif (e.timer == "emote4") then
		event_emote(e,"You hear the pounding of Ry`gorr war drums. ");
		eq.set_timer("emote5",12000);
	elseif (e.timer == "emote5") then
		e.self:Say("It is of utmost importance that you stay with me throughout the fight. Your focus must be on killing Chief Rygorr and keeping me alive, mind that you do not become distracted. If I fall the Dain's men will retreat and you'll definitely be cut down.");
	elseif(e.timer == "emote7") then
		e.self:Say("Listen up men!");
		eq.set_timer("emote8",10000);
	elseif(e.timer == "emote8") then
		e.self:Say("You all know why we're here. For decades these savages have menaced our people. Recent events have been too much to bear and the Dain has declared war! We will stop at nothing short of the Ry`gorr's annihilation!");
		eq.set_timer("emote9",20000);
	elseif(e.timer == "emote9") then
		e.self:Say("No longer will we tolerate their heathen presence in our lands! Never again will we mourn the loss of a Coldain to these pawns of the Kromrif! Our deeds here today shall make this land safe for Coldain for all time!");
		eq.set_timer("emote10",20000);
	elseif(e.timer == "emote10") then
		e.self:Say("Today the Ry`gorr fall! Tomorrow the Kromrif!");		
	elseif(e.timer == "emote11") then
		e.self:Say("Stay back from the initial charge, my friend. We will go directly for the chief once the troops are engaged. Follow me closely!");
	elseif(e.timer == "charge") then	-- charge signal 2 minutes after reaching formation		
		eq.signal(116549,2);        -- signal paladins
		eq.signal(116541,2);        -- signal priests
		eq.signal(116555,2);        -- signal archers
		eq.signal(116563,2);        -- signal wolves	
		eq.set_timer("aggro",5000);
		eq.set_timer("depop",600000);	-- depop after 10 minutes
	elseif(e.timer == "aggro") then
		e.self:CastToNPC():AddToHateList(eq.get_entity_list():GetMobByNpcTypeID(116584),1);
	elseif(e.timer == "depop") then
		depop_Mobs();
		eq.depop_with_timer();
	end
	eq.stop_timer(e.timer);
end
	
function event_emote(e,message)
	local player_list = eq.get_entity_list():GetClientList();
	if(player_list ~= nil) then
		for player in player_list.entries do	
			if(player:CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ()) <= 200) then
				player:Message(6,message)
			end
		end
	end
end
	
function event_death_complete(e)
	depop_Mobs();
end	
	
function depop_Mobs()
	eq.depop_all(116549);
	eq.depop_all(116541);
	eq.depop_all(116555);
	eq.depop_all(116563);
	eq.depop_all(116556);
	eq.depop_all(116548);
	eq.depop_all(116548);
	eq.depop_all(116006);
	eq.depop_all(116584);
	eq.depop_all(116593);
end