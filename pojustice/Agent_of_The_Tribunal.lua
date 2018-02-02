--Agent_of_The_Tribunal (201075)
--All Trials
--Kilelen
--modified by greenbean 03/23/2010

--Variable to stop them from leaving.
--local hold_them = 0;
local hold_execution = 0;
local hold_flame = 0;
local hold_hanging = 0;
local hold_lashing = 0;
local hold_stoning = 0;
local hold_torture = 0;

function event_spawn(e)
	hold_execution = 0;
	hold_flame = 0;
	hold_hanging = 0;
	hold_lashing = 0;
	hold_stoning = 0;
	hold_torture = 0;
end

function event_say(e)
	if e.message:findi("hail") then
		e.self:Say("Do you wish to [" .. eq.say_link("return") .. "]?");
	elseif e.message:findi("return") then
		local x = e.self:GetX();
		local y = e.self:GetY();
	  
		--Execution
		if ((x == 142) and (y == -1044)) then
			 if (hold_execution == 0) then
				e.self:Say("Very well.");
				e.other:MovePC(201,456,825,9,250);
			else 
				e.self:Say("The trial is yet underway.  You must wait.");
			end
	
		--Flame
		elseif ((x == 911) and (y == -793)) then
			 if (hold_flame == 0) then
				e.self:Say("Very well.");
				e.other:MovePC(201,456,825,9,250);			  
			 else 
				e.self:Say("The trial is yet underway.  You must wait.");
			 end

		--Hanging
		elseif ((x == 490) and (y == -1046)) then
			if (hold_hanging == 0) then
				e.self:Say("Very well.");
				e.other:MovePC(201,456,825,9,250);
			else 
				e.self:Say("The trial is yet underway.  You must wait.");
			end

		--Lashing
		elseif ((x == 1343) and (y == -1137)) then
			if (hold_lashing == 0) then
				e.self:Say("Very well.");
				e.other:MovePC(201,456,825,9,250);
			else 
				e.self:Say("The trial is yet underway.  You must wait.");
			end
	   
		--Stoning
		elseif ((x == -148) and (y == -1195)) then
			if (hold_stoning == 0) then
				e.self:Say("Very well.");
				e.other:MovePC(201,456,825,9,250);
			else 
				e.self:Say("The trial is yet underway.  You must wait.");
			end
	   
		--Torture
		elseif ((x == 772) and (y == -1147)) then
			if (hold_torture == 0) then
				e.self:Say("Very well.");
				e.other:MovePC(201,456,825,9,250);
			else 
				e.self:Say("The trial is yet underway.  You must wait.");
			end
		end
	end
end


  
 
function event_signal(e)
	local x = e.self:GetX();
	local y = e.self:GetY();

	--Trial of Execution started (event locked)
	if (e.signal == 1) then
		hold_execution = 1;

	--Trial of Flame started (event locked)
	elseif (e.signal == 2) then
		hold_flame = 1;

	--Trial of Hanging started (event locked)
	elseif (e.signal == 3) then
		hold_hanging = 1;

	--Trial of Lashing started (event locked)
	elseif (e.signal == 4) then
		hold_lashing = 1;

	--Trial of Stoning started (event locked)
	elseif (e.signal == 5) then
		hold_stoning = 1;

	--Trial of Torture started (event locked)
	elseif (e.signal == 6) then
		hold_torture = 1;

	--Trial of Execution failed or success (event open)
	elseif (e.signal == 11) then
		hold_execution = 0;

	--Trial of Flame failed or success (event open)
	elseif (e.signal == 12) then
		hold_flame = 0;

	--Trial of Hanging failed or success (event open)
	elseif (e.signal == 13) then
		hold_hanging = 0;

	--Trial of Lashing failed or success (event open)
	elseif (e.signal == 14) then
		hold_lashing = 0;

	--Trial of Stoning failed or success (event open)
	elseif (e.signal == 15) then
		hold_stoning = 0;

	--Trial of Torture failed or success (event open)
	elseif (e.signal == 16) then
		hold_torture = 0;
	end
end
    
 
