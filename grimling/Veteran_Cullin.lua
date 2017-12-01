--Veteran Cullin (167196)
--part of Veteran Vadrel's raid 

local ThreadManager = require("thread_manager");

local spawnpoints = {	334946, 334947, 334948, 334949, 334950, 334951, 334952, 334953, 334954, 334955, 334956, 	--camp #9 spawns
						334957, 334958, 334959, 334960, 334961, 334962, 334963, 334964, 334965, 334966, 334967, 334968, 334969};	--camp #8 spawns

local veterans = {	167731, 	--Shiktan
					167732, 	--Kufur
					167733};	--Fhelik
local cullin;
local commander = false
local started = false
local encounter_load = false;
local camp;

--Veterans defined
local shiktan;
local kufur;
local fhelik;

--encounter load triggers
local kufur_ready = false;
local cullin_ready = false;


local pathing_target = {[1] = {35, 338, -5},  --camp #8
						[2] = {110, 960, -8}};	--camp #9

function event_say(e)
	if not started and e.message:findi("hail") then
		e.self:Say("Hello, " .. e.other:GetName());
	end
end
						
function event_spawn(e)
	e.self:SetRunning(false);
	started = false;
	camp = 1;
	kufur_ready = false;
	cullin_ready = false;
end


function event_signal(e)
	if e.signal == 1 then	--Final grimling war signal for success
		e.self:Shout("We are victorious!  Bring me proof of the high commander's death.");
		commander = true;		--signal from encounter once commander is killed
		eq.set_timer("reset", 30 * 60 * 1000) --set time to hand-in before event will reset automatically (30 min)
	elseif e.signal == 2 then
		e.self:Shout("We must finish strong! Keep the camps secured until the high commander has fallen!"); 
	elseif e.signal == 10  then --signal from Veteran to move to grimling camp (For Veteran Vandrel's raid)
		started = true;
		e.self:SetRunning(true);
		e.self:Say("For the honor of the Vah Shir, Attack!");
		eq.move_to(-720, 356, -11, 30, true);
	elseif e.signal == 11 then	--signal from Veteran to move to back to vah shir camp after successful raid (For Veteran Vandrel's raid)
		eq.get_entity_list():GetSpawnByID(334767):Repop(5);	--repop Veteran Cullin
		eq.depop();
	elseif e.signal == 50 then
		e.self:Shout("The grimlings are capable of attacking from any direction.  Be on your guard!");		--signal from encounter on event start
	end
end


function event_trade(e)
    local item_lib = require("items");
	if (not started and item_lib.check_turn_in(e.self, e.trade, {item1 = 6191})) then 	--Staginar's Battle Orders
		WarSetup();	--set default variables
		e.self:SetRunning(false);
		eq.unload_encounter("Final_War");
		e.self:Say("The time has finally come to slay the last of the grimlings.  Follow me " .. e.other:GetName() .. ", we will meet outside of the outpost with the other veterans and make our final preparations."); 
		eq.start(24);	
	elseif (commander and item_lib.check_turn_in(e.self, e.trade, {item1 = 6270})) then 	--Arm of the Grimling High Commander
		e.self:Say("We are eternally grateful for your assistance with our war efforts " .. e.other:GetName() .. ".  Please accept this medallion in honor of your triumphs here today.  You will also need to take this obelisk we found on the high commander's corpse to General Staginar as proof of our success on the battlefield. Farewell!");
		e.other:SummonItem(6271);	--Medallion of the Shar Vahl Hero
		e.other:QuestReward(e.other,0,0,0,0,34142,5000);  -- Magical Acrylia Obelisk
		DepopVeterans();
		eq.get_entity_list():GetSpawnByID(334767):Repop(5);	--repop Veteran Cullin
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	if e.timer == 'TMHB' then
		cullin = e.self;
		ThreadManager:GarbageCollect();
		ThreadManager:Resume("BattlePlans");
	elseif e.timer == "loc_check" then	
		if kufur:GetX() == 589 and kufur:GetY() == 901 and not kufur_ready then
			kufur_ready = true;
		elseif kufur_ready and cullin_ready then
			eq.stop_timer(e.timer);
			ThreadManager:Clear();
			ThreadManager:Create("BattlePlans", FinalCharge);
		end
	elseif e.timer == "vet_check" then
		if not CheckVeterans() then
			e.self:Shout("One of ours has fallen!  We cannot continue!");
			DepopVeterans();
			eq.depop_with_timer();
		end		
	elseif e.timer == 'camp_check' then
		if not CampCheck() then
			eq.stop_timer(e.timer);
			eq.resume();	--resume pathing
			if camp == 1 then
				camp = 2;  --set to check next distance radius
				e.self:Say("Area clear!  Quickly, to the next camp due north!")
				MoveVeterans(110, 960, -8,-1,5,5);
			elseif camp == 2 then
				eq.resume();
				MoveVeterans(49, 975, 3, 70, 0, 7);
				camp = 3;
			end
		end
	elseif e.timer == "reset" then		--this should not really ever be needed, but is added anyway in case of an event win but the final turn-in is not complete so it will reset automatically
		eq.stop_timer(e.timer);
		DepopVeterans();
		eq.get_entity_list():GetSpawnByID(334769):Repop(5);	--repop Veteran
		eq.depop();
	end
end

function event_waypoint_arrive(e)
	if e.wp == 5 then
		eq.unique_spawn(veterans[1], 0, 0, 7, 127, 5, 129);
		eq.unique_spawn(veterans[2], 0, 0, 14, 127, 5, 129);
		eq.unique_spawn(veterans[3], 0, 0, 21, 127, 5, 129);
	elseif e.wp == 7 then
		cullin = e.self;
		eq.set_timer("TMHB", 500);
		e.self:SetRunning(true);
		ThreadManager:Clear();
		ThreadManager:Create("BattlePlans", Briefing);
		eq.pause(1000);
		camp = 1;
	elseif e.wp == 8 then
		ThreadManager:Clear();
		ThreadManager:Create("BattlePlans", Camp1Charge);
		eq.pause(1000);
	elseif e.wp == 9 then
		eq.pause(1000);
		eq.set_timer("camp_check",1);
	elseif e.wp == 10 then
		eq.pause(1000);
		eq.set_timer("camp_check",1);
	elseif e.wp == 11 then
		ThreadManager:Clear();
		ThreadManager:Create("BattlePlans", Split);
		eq.pause(1000);
	elseif e.wp == 12 then
		local shiktan = eq.get_entity_list():GetNPCByNPCTypeID(veterans[1]);
		shiktan:MoveTo(-782,1258,44,172,true);
	elseif e.wp == 13 then
		cullin_ready = true;
	end
end

function WarSetup()
	started = true;
	encounter_load = false;
	commander = false;
	camp = 1;
	kufur_ready = false;
	cullin_ready = false;	
end

function Briefing()
	cullin:Say("Listen up troops.  General Staginar has given us specific battle plans for our final assault.  We will moving north to swiftly eliminate two of the smaller grimling camps on our way to the ridge.  Once we reach the ridge, there will be two final areas occupied by grimlings that we will need to overtake.  This will require that we split our forces and attack both camps simultaneously and drive back any grimling reinforcements that arrive.");
	ThreadManager:Wait(30);
	cullin:Say("We expect the most grimling resistance from their encampment outside the mines entrance to the northwest.  Veteran Kufur and Veteran Fhelik will require the largest raid party to hold down this area.  Veteran Shiktan and myself will require atleast 18 soldiers to accompany us to the northeast grimling encampment.  Remember that if any of the veterans or myself should fall in battle then we will not be able to maintain our defenses and all will be lost.");
	ThreadManager:Wait(30);	
	cullin:Say("If we resist the grimling reinforcements for a long enough period of time then we will be sure to drive out the grimling high commander from within the northeast fort.  We expect the grimling high commander will send his strongest and most capable soldiers to stall our offensive.  These grimlings will no doubt be more challenging than any other grimlings you've previously encountered in the forest.");
	ThreadManager:Wait(30);	
	cullin:Say("Please make your final preparations now as there will be no rest until the grimling high commander and his minions have all been slain.  We will start our ambush in two minutes.");
	ThreadManager:Wait(120);
	eq.resume();
	eq.set_timer("vet_check", 1 * 1000);
end

function Camp1Charge()
	cullin:Say("Veterans, follow my lead!");
	DepopCamp();
	RepopCamp();		
	MoveVeterans(3,140,10,256,7,0)
	ThreadManager:Wait(5);
	cullin:Say("For the Vah Shir, Attack!");
	eq.resume();
	ThreadManager:Wait(0.2);
	MoveVeterans(35, 338, -5, -1, 5, 5);
end

function Split()
	shiktan = eq.get_entity_list():GetNPCByNPCTypeID(veterans[1]);
	kufur = eq.get_entity_list():GetNPCByNPCTypeID(veterans[2]);
	fhelik = eq.get_entity_list():GetNPCByNPCTypeID(veterans[3]);
	
	ThreadManager:Wait(15);
	cullin:Say("The moment of truth is upon us now friends.  Veteran Kufur and Veteran Fhelik will now march their raiding party over the west hills to secure the acrylia mines area.  Veteran Shiktan and I will lead our party to the northeast to the last grimling encampment we have yet to secure.  Make sure you do not leave any grimling within sight alive.")
	ThreadManager:Wait(20);		
	cullin:Say("Move out troops!  May the spirits bless us on the battlefield.");
	eq.resume();
	eq.set_timer("loc_check", 1);
	ThreadManager:Wait(0.5);
	shiktan:MoveTo(-329,987,37,213,true);
	kufur:MoveTo(589,901,30,80,true);
	fhelik:MoveTo(586,910,30,80,true);
end

function FinalCharge()
	shiktan = eq.get_entity_list():GetNPCByNPCTypeID(veterans[1]);
	kufur = eq.get_entity_list():GetNPCByNPCTypeID(veterans[2]);
	fhelik = eq.get_entity_list():GetNPCByNPCTypeID(veterans[3]);
	
	cullin:Say("Be prepared to charge the camp ahead and clear all grimlings in sight once I give the call.  I will announce once we have the camp secured.");
	kufur:Say("We will charge the camp ahead upon Veteran Cullin's signal.  Slay all grimlings in sight until I confirm the camp is secured.  Get ready for battle!");
	ThreadManager:Wait(30);
	cullin:Shout("Glory to the King! CHARGE!!!");
	ThreadManager:Wait(2);
	cullin:MoveTo(-1058, 1075, 11, 230, true);
	shiktan:MoveTo(-1079, 1114, 6, 94, true);
	kufur:MoveTo(783, 797, 12, 65, true);
	fhelik:MoveTo(798, 712, 16, 65, true);
	eq.stop();
	eq.load_encounter("Final_War");
	encounter_load = true;
end
	
function MoveVeterans(x,y,z,h,xdiff,ydiff)
	for n = 1,3 do
		local vet = eq.get_entity_list():GetMobByNpcTypeID(veterans[n]);
		vet:SetRunning(true);
		vet:CastToNPC():MoveTo(x+(n*xdiff),y+(n*ydiff),z,h,true);
	end
end

function DepopVeterans()
	for n = 1,3 do
		eq.depop(veterans[n]);
	end
end

function CheckVeterans()
	for n = 1,3 do
		if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(veterans[n]) then
			return false;	--returns false if a veteran is not alive
		end
	return true;  --all veterans still up
	end
end

function CampCheck(e)
	local npc_list = eq.get_entity_list():GetNPCList();
	
	if(npc_list ~= nil) then
		for npc in npc_list.entries do								 
			if npc:CalculateDistance(unpack(pathing_target[camp])) <= 100 and npc:GetNPCTypeID() ~= 167196 and npc:GetNPCTypeID() ~= veterans[1] and npc:GetNPCTypeID() ~= veterans[2] and npc:GetNPCTypeID() ~= veterans[3] and not npc:IsPet() and npc:GetRace() ~= 216 then
				return true	--mobs still in camp
			end
		end
	end
	
	return false
end

function DepopCamp()
	for _,spawns in pairs(spawnpoints) do
		local npc_list = eq.get_entity_list():GetNPCList();

		if(npc_list ~= nil) then
			for npc in npc_list.entries do
				if npc:GetSpawnPointID() == spawns then
					npc:Depop(true);
				end
			end
		end
	end
end

function RepopCamp()
	for _,spawns in pairs(spawnpoints) do
		local CampSpawn = eq.get_entity_list():GetSpawnByID(spawns);
		CampSpawn:Enable();
		CampSpawn:Reset();
		CampSpawn:Repop(5);
	end
end

function event_death_complete(e)
	if started then
		e.self:Shout("My friends, I have fallen!");
		if not encounter_load then	--added incase a death occurs before the encounter script has loaded.  
			DepopVeterans();
		end
	end
end
	

