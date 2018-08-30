--#Terris_Thule (204065)
--Projection as part of Hedge Event

local ThreadManager = require("thread_manager");
local started = false;

function event_spawn(e)
	eq.set_timer("depop", 3 * 60 * 1000)  --3 min depop
	eq.set_timer("TMHB", 500);
end

function event_signal(e)
	if checkThelin(e) then
		ThreadManager:Create("Terris",Escape);		
	end
end

function Escape(e)
	ThreadManager:Wait(3);
	terris:Say("You fool!  You did not earn this prize on your own!  The contract that has been drawn is now invalid.  You will never leave my grasp, prepare your soul for eternal torment!");
	ThreadManager:Wait(4);
	terris:SendSpellEffect(95, 3000,0,false,0);	--simulate Gate being cast
	ThreadManager:Wait(3);
	terris:Emote("laughs heartily and then vanishes in a swirl of incorporeal mist.");
	eq.depop();
end

function event_timer(e)
	if e.timer == "TMHB" then		
		terris = e.self;
		ThreadManager:GarbageCollect();
		ThreadManager:Resume("Terris");
	end
end

--this should not really be needed, but is added incase multiple mazes have been completed at same time as to not duplicate dialogue or signals
function checkThelin(e)
	local mob_list = eq.get_entity_list():GetMobList();
	if mob_list ~= nil then
		for mob in mob_list.entries do
			if mob:GetNPCTypeID() == 204479 and mob:CalculateDistance(e.self:GetX(),e.self:GetY(),e.self:GetZ()) < 600 then
				return true;
			end
		end
	end
	return false;
end

