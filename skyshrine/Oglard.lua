-- NPC:  Oglard
--zone:  Skyshrine

--First quest npc to begin the Spirit of Garzicor Quest.  http://everquest.allakhazam.com/db/quest.html?quest=1277
--Players must be ALLY with Claws of Veeshan to receive quest dialog and progress

function event_say(e)
	local qglobals = eq.get_qglobals(e.self,e.other);

	if (e.other:GetFaction(e.self) == 1) then  	--check for ally faction
		
		--Dialogue responses for 1.0 step of quest
		if(e.message:findi("hail")) then
			e.self:Say("Greetings young " .. e.other:Race() .. ". Very few of your kind has ever seen the halls you now walk through. You must have provided a great service to our kin for them to allow you passage into this inner sanctum. We welcome you to our ancient home.");
		elseif(e.message:findi("thank you")) then
			e.self:Say("Might, wisdom, and manners? Quite a surprise to see all of these traits in one of the younger races. I am impressed. I see you are a noble creature, one who would treat another creature of nobility with respect...");
			e.self:Emote("'s eyes suddenly begin to shine with a magical, golden, light. He looks down upon you as if in judgement and asks, 'Tell me, " .. e.other:GetName() .. ", have you done [battle with dragons]?'");
		elseif((e.message:findi("yes") and e.message:findi("battle with dragon")) or (e.message:findi("i have done battle with dragon"))) then
			e.self:Emote("'s eyes slowly begin to lose the golden light that flared earlier. He then studies you carefully before saying 'There are many Dragons on this world that do not share our beliefs. If you have done battle with dragons and have lived, then you may be able to [help] us."); 
		elseif((e.message:findi("no") and e.message:findi("battle with dragon")) or (e.message:findi("i have not done battle with dragon"))) then
			e.self:Emote("'s eyes begin to gleam even brighter, then quickly fade, a frown left apon the wurm's face. 'Hmm... I see. Thank you for your information. Good luck in your travels.'");
			e.other:Faction(42, -1); --CoV reduced by 1
		elseif(e.message:findi("help")) then
			e.self:Say("When a Dragon dies, his spirit leaves his corporeal body and joins Veeshan among the stars. It is our greatest desire, to be without desire, at the time of our death. Even in preparation for battle, we accept that we may die and strive to be empty of desire so that our spirits do not cling to this world when our end has come. For some, however, this is [not the case]."); 
		elseif(e.message:findi("not the case")) then
			e.self:Say("When a Dragon dies, and his heart is filled with desire, his spirit will remain here in the filth of this world. The greatest torment is to transcend one's body, and still be confined to this world. Like being trapped within a cell with a single locked door, having the key to unlock it and escape, yet having no hands to use the key. This has befallen one of our [comrades].");
		elseif(e.message:findi("comrade")) then
			e.self:Say("And therein lies our plight. Our fellow Dragon now suffers eternally in unlife, between worlds. We hear his pained howls when we sleep, unable to aid our fallen comrade. He turned his back on us centuries ago, and joined the Ring of Scale. In response to this we erased his name and bloodline, along with the others who left, from our memories and books. He is still Dragon though, and does not deserve the fate he's been dealt. Without his [name], we are helpless."); 
		elseif(e.message:findi("name")) then
			e.self:Say("Unfortunately our libraries have no record of him. We know of his death from 2 sources only. Our Lord Yelinak was the first to hear his tormented howling. Then the rest of us slowly began to hear him as well. A chosen few left our home to find his corpse if possible. We were surprised to find he had died here on this continent. Apparently he had [returned] to us, which pains us even more."); 
		elseif(e.message:findi("returned")) then
			e.self:Say("His body was found in the Eastern Wastes, spears of the Kromzek protruding from his side and chest.' The wurm pauses for a moment to sigh heavily. He continues, sorrow on his voice, 'We believe......we hope, one of the sentient races witnessed his murder. Chances are slim to nil, but perhaps one of those.....Caldoin? Or something? Found him and recorded his name. Will you investigate this for us, " .. e.other:GetName() .. " ?"); 
		elseif(e.message:findi("I will investigate this for you")) then
			e.self:Say("We are greatful for your service to us. We know you have little interest in our affairs, yet you risk your life to aid us. Once you find his name, then perhaps we can find a way to release his restless spirit. If you do this, you will be rewarded with an item of your choice from our hoard of treasure. Begin with.....whatever they call themselves. The Giants refer to them as iron pellets. Return to me proof of his name and he will be remembered."); 
			if (qglobals["garzicor"] == nil) then
				eq.set_global("garzicor","1",5,"F"); -- Completed Garzicor Quest Part 1.0
			end
		end
		
	end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.self,e.other);
	
	if (e.other:GetFaction(e.self) == 1) then  	--check for ally faction
		
		--Quest Trade Dialog for Step 4.0
		if (qglobals["garzicor"] == "3") then
			if(item_lib.check_turn_in(e.trade, {item1 = 1837})) then	--Check for Onyxbrand (Axe from Ghost of Burdael)	
				e.self:Emote("examines the axe closely. The wurm's eyes widen as he makes out the name of Garzicor and immediately raises his head to the ceiling, letting out a howl of emotional pain. Your bones shake with the screach, an image of a man in the midst of a rain of his own child's blood comes to mind, the agony is so great. Out of breath, Oglard drops his head and focuses his attention back to you, barely able to hold himself up. He places an urn before you and says, 'You must find his corpse. Find his burial site and summon Garzicor's spirit by speaking your remembrance of him. Speak to him and find out all you can. Return to me with 2 pieces of his corpse combined in that urn. Help us " .. e.other:GetName() .. " , you MUST!'");
				e.other:Faction(42, 15); --CoV
				e.other:Faction(362, 3); --Yelinak
				e.other:Faction(189, -7); --Kromzek
				e.other:QuestReward(e.self,0,0,0,0,17050,250);	-- Dragon Crafted Urn (Combine Container)
				
				--if (tonumber(qglobals["garzicor"]) < 4) then	--checks qglobals flag to see if already progressed further on quest
					eq.set_global("garzicor","4",5,"F"); -- Completed Garzicor Quest Part 4.0
				--end
			end
		end

		--Quest Trade Dialog for Step 6.0
		if (qglobals["garzicor"] == "4") then		--  checks for qglobal of 4.0 since 5.0 event does not currently give a qglobal flag.  5.0 flag will be awarded below and 6.0 to be awarded by Eldriaks
			if(item_lib.check_turn_in(e.trade, {item1 = 1887})) then	--Check for Dragon Crafted Urn (1st version)
				e.self:Say("You found it!  Thank you, ".. e.other:GetName() .. ".  Please show this immediately to Eldriaks.  He should be nearby."); 	--need actual quest text
				e.other:QuestReward(e.self,0,0,0,0,2053,100);	-- Dragon Crafted Urn (2nd version)
				--if (tonumber(qglobals["garzicor"]) < 5) then	--checks qglobals flag to see if already progressed further on quest
					eq.set_global("garzicor","5",5,"F"); -- Completed Garzicor Quest Part 5.0
				--end
			end
		end
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

	