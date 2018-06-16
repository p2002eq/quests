--Aid Eino Escort
--Ponightmare


local wave;

function event_spawn(e)
	wave = 0;
	e.self:Emote("steps from the shadows 'I am glad you were able to come help me, this is quite a dangerous realm! We must tread carefully if we are to find the item Kerasha desires from this vile place. Sometimes I worry her research with the magic of the land puts her in much danger. Let us be off and find that which she desires.'");
	eq.start(150);	--pathing grid
end

function event_waypoint_arrive(e)
	if e.wp == 2 and wave == 0 then
		e.self:Say("Vile Beasts!  Our presence has been detected!  Let not their dreams of evil sway you!");
		wave1_mob1 = eq.spawn2(204076,0,0,e.self:GetX()+20,e.self:GetY()+20,e.self:GetZ(),e.self:GetHeading());		--#a_tortured_banshee (204076)
		wave1_mob2 = eq.spawn2(204076,0,0,e.self:GetX()-20,e.self:GetY()-20,e.self:GetZ(),e.self:GetHeading());
		wave1_mob3 = eq.spawn2(204076,0,0,e.self:GetX()+20,e.self:GetY()-20,e.self:GetZ(),e.self:GetHeading());
		wave1_mob4 = eq.spawn2(204076,0,0,e.self:GetX()-20,e.self:GetY()+20,e.self:GetZ(),e.self:GetHeading());
		wave1_mob1:AddToHateList(e.self,1);
		wave1_mob2:AddToHateList(e.self,1);
		wave1_mob3:AddToHateList(e.self,1);
		wave1_mob4:AddToHateList(e.self,1);
		wave = 1;
	elseif e.wp == 4 and wave == 1 then 
		e.self:Say("Even in my home I always hated werewolves, I fear you not vile fiends!");
		wave2_mob1 = eq.spawn2(204077,0,0,e.self:GetX()+20,e.self:GetY()+20,e.self:GetZ(),e.self:GetHeading());		--#a_nightstalker (204077)
		wave2_mob2 = eq.spawn2(204077,0,0,e.self:GetX()-20,e.self:GetY()-20,e.self:GetZ(),e.self:GetHeading());
		wave2_mob1:AddToHateList(e.self,1);
		wave2_mob2:AddToHateList(e.self,1);
		wave = 2;
	elseif e.wp == 5 and wave == 2 then
		e.self:Say("Have you ever had a dream where you were being chased and could not run?  This place is the source of such nightmares.  Break those blocks and defend yourself!");
		wave3_mob1 = eq.spawn2(204078,0,0,e.self:GetX()+20,e.self:GetY()+20,e.self:GetZ(),e.self:GetHeading());		--#a_hobgoblin (204078)
		wave3_mob2 = eq.spawn2(204078,0,0,e.self:GetX()-20,e.self:GetY()-20,e.self:GetZ(),e.self:GetHeading());		
		wave3_mob3 = eq.spawn2(204078,0,0,e.self:GetX()+20,e.self:GetY()-20,e.self:GetZ(),e.self:GetHeading());		
		wave3_mob4 = eq.spawn2(204078,0,0,e.self:GetX()-20,e.self:GetY()+20,e.self:GetZ(),e.self:GetHeading());		
		wave3_mob1:AddToHateList(e.self,1);
		wave3_mob2:AddToHateList(e.self,1);
		wave3_mob3:AddToHateList(e.self,1);
		wave3_mob4:AddToHateList(e.self,1);
		wave = 3;
	elseif e.wp == 8 and wave == 3 then
		e.self:Say("Something knows we hunt it!  Cast your trepidations aside and defeat this evil!  Fear us Keeper, we have come for you!");
		wave4_mob1 = eq.spawn2(204076,0,0,e.self:GetX()+30,e.self:GetY(),e.self:GetZ() + 5,e.self:GetHeading());		--#a_tortured_banshee (204076)
		wave4_mob2 = eq.spawn2(204076,0,0,e.self:GetX()-30,e.self:GetY(),e.self:GetZ() + 5,e.self:GetHeading());
		wave4_mob3 = eq.spawn2(204076,0,0,e.self:GetX(),e.self:GetY()-30,e.self:GetZ() + 5,e.self:GetHeading());
		wave4_mob4 = eq.spawn2(204079,0,0,e.self:GetX()+30,e.self:GetY()+30,e.self:GetZ() + 5,e.self:GetHeading());		--#a_tremulous_bat (204079)
		wave4_mob5 = eq.spawn2(204079,0,0,e.self:GetX()-30,e.self:GetY()-30,e.self:GetZ() + 5,e.self:GetHeading());
		wave4_mob6 = eq.spawn2(204079,0,0,e.self:GetX()+30,e.self:GetY()-30,e.self:GetZ() + 5,e.self:GetHeading());
		wave4_mob1:AddToHateList(e.self,1);
		wave4_mob2:AddToHateList(e.self,1);
		wave4_mob3:AddToHateList(e.self,1);
		wave4_mob4:AddToHateList(e.self,1);
		wave4_mob5:AddToHateList(e.self,1);
		wave4_mob6:AddToHateList(e.self,1);
		wave = 4;
	elseif e.wp == 9 then
		e.self:Say("Excellent rest up for a few moments, rally your strength as I meditate on a teaching of Quellious.");
		e.self:SetAppearance(1);
	elseif e.wp == 10 and wave == 4 then
		e.self:Say("The fiend shows itself!  Spew your vile dreams no longer!  Dispatch it!");
		wave5_1mob = eq.spawn2(204080,0,0,e.self:GetX()+20,e.self:GetY()+20,e.self:GetZ(),e.self:GetHeading());	--#The_Dreamkeeper (204080)
		wave5_1mob:AddToHateList(e.self,1);
		wave = 5;
	elseif e.wp == 12 then
		e.self:Say("Hand me the strand from the beast.  Quellious knows what Kerasha wants with such a thing.'");
	end
end

function event_waypoint_depart(e)
	if e.wp == 2 then
		e.self:Say("Now that our presence here is discovered we cannot delay. Rest when you can.");
	elseif e.wp == 4 or e.wp == 5 then
		e.self:Say("Now that you are rested, follow my steps, may Quellious guard us!")
	elseif e.wp == 9 then
		e.self:SetAppearance(0);
	elseif e.wp == 11 then
		e.self:Emote("gathers his strength and limps forward. 'Follow my steps to the portal!'")
	end
end

function event_signal(e)
	if e.signal == 1 then	--death of #The_Dreamkeeper
		e.self:Emote("holds his bleeding side 'That beast was quite vicious, quickly let us make our way to the portal, I must seek the healers of tranquility to staunch this wound.  Give me a moment to gather my strength.");
	end
end


function event_trade(e)
    local item_lib = require("items");	
	local qglobals = eq.get_qglobals(e.self, e.other);
	
    if e.self:GetX() == 1509 and e.self:GetY() == 281 and wave == 5 and tonumber(qglobals.EinoTrigger) == 1 and item_lib.check_turn_in(e.self, e.trade, {item1 = 16261}) then  --Strand of Nightmare
		e.self:Say("Excellent!  You and your companions have served me well, take my mark as a symbol of trust.  The Council may smile more favorably upon you now.  May Quellious watch over you!");
		e.other:QuestReward(e.other,0,0,0,0,16260, 10000);  --Tiny Gold Fist
		eq.delete_global("EinoTrigger");
		eq.set_global("AidEinoDone","1",5,"F");
		eq.depop();
	end	
	
    item_lib.return_items(e.self, e.other, e.trade)
end

