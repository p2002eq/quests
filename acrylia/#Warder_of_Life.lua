-- #Ward_of_Life (154154)
-- #Khati Sha Event

local ChantCounterA = nil;
local ChantCounterB = nil;
local activated = false;

--cell x,y spawn locations
local xloc = {344,344};		--(1) Kama's Cell (2) Andro's Cell  
local yloc = {-232,-323};	--(1) Kama's Cell (2) Andro's Cell  


function event_spawn(e)
	eq.set_timer("adds",math.random(90,150)*1000);
	ChantCounterA = 0;
	ChantCounterB = 0;
	activated = false;
	deactivate(e.self);
end

function event_signal(e)
	if e.signal == 90 then
		ChantCounterA = ChantCounterA + 1;		
		ChantSumCheck(e,ChantCounterA,ChantCounterB);
	elseif e.signal == 95 then
		ChantCounterB = ChantCounterB + 1;
		ChantSumCheck(e,ChantCounterA,ChantCounterB);
	end
end

function event_timer(e)
	if(e.timer == "adds") then
		SpawnAdds(math.random(1,3),1);	--spawns 1-3 adds in Kama's Cell
		SpawnAdds(math.random(1,3),2);	--spawns 1-3 adds in Andro's Cell
	end
end


function SpawnAdds(total,cell)	
	for n = 1,total do 
		eq.spawn2(eq.ChooseRandom(154157,154158),0,0,xloc[cell] + math.random(-15,15),yloc[cell] + math.random(-15,15),-7,128);	--randomize spawn in cell
	end
end

function ChantSumCheck(e,A,B)
	if A ~= nil and B ~= nil and not activated then
		if A == 8 and B == 8 then  -- requires 8 successful chants by each (16 total )
			activated = true;
			activate(e.self);
			eq.signal(154130,2); --signals to  stop spawning of spell jammers
			eq.depop_all(154157); --depops reanimated prisoners if up
			eq.stop_timer("adds");
		end
	end
end

function deactivate(mob)
	mob:SetBodyType(11, true);
	mob:SetSpecialAbility(24, 1);
	mob:WipeHateList();
end

function activate(mob)
	mob:SetBodyType(3, true);
	mob:SetSpecialAbility(24, 0);
end

function event_combat(e)
	if e.joined then
		e.self:Say("As the guardian of the first seal, hear this: The first seal is life, and it shall not be broken. None shall pass and death to those who would attempt to thwart me. Be gone!")
	end
end

function event_death_complete(e)
	eq.signal(154130,10);
	eq.zone_emote(13,"The Life Ward has been defeated. The first seal is broken.")
end