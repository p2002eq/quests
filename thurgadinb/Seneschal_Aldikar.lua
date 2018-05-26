--Seneschal_Aldikar (129000)
--thurgadinb

local escort = false;

function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	if(e.other:GetFaction(e.self) <= 4) then --Amiable or lower
		if(e.message:findi("hail") and not escort) then	
			e.self:Say("And a good day to you, "..e.other:Race()..". I must say that i'm impressed that your people were even able to make it to our continent, let alone survive the frigid temperatures of it. I am Seneschal Aldikar, Commander of the Armies of Thurgadin, known by some as the Sword of the Dain. My armies are currently undergoing intensive training and are ready for a full assault on Kael Drakkel as soon as his majesty gives the order.");
		elseif(e.message:findi("accept this task") and (qglobals["ring9"] == "1") and e.self:GetX() == 6 and e.self:GetY() == 772) then	--check he is in quarters
			eq.stop_all_timers(e.self);
			e.self:Say("In this box, place the accursed dirk of the fallen Rodrick. With it combine the heads of every traitor you dispose of. When this is done give the box and the velium insignia ring to the Dain directly. On behalf of the crown and all good Coldain, I thank you ... May Brell be with you.");
			e.self:Say("Farewell.");
			e.other:SummonItem(17055); --Traitors Bane Box
		end
	end
end

function event_trade(e)
	local item_lib = require("items");	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30164})) then	--Velium Coldain Insignia Ring
		if e.self:GetX() == -2 and e.self:GetY() == 692 then	--check for location at throne (day session only)
			e.self:Say("Well done " .. e.other:GetName() .. ", I have heard of your victory over the Ry'Gorr. If you are willing to assist the crown further please follow me.");
			eq.set_global("ring9","1",5,"F"); 
			e.other:SummonItem(30164);	--Velium Coldain Insignia Ring
			escort = true;
			e.self:SetCurrentWP(0);
			eq.start(54);	--path back to room
		else
			e.self:Say("I must speak to the Dain before I instruct you further. Please speak to me while the royal court is in session.");
			e.other:SummonItem(30164);	--return Velium Coldain Insignia Ring
		end		
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

function event_waypoint_arrive(e)
	if e.wp == 11 and escort then
		eq.set_timer("1",10000);
	end
end

function event_timer(e)
	if(e.timer == "1") then
		e.self:Say("Please, shut the door behind you. What I am about to share with you must not be overheard.");
		eq.set_timer("2",12000);
	elseif(e.timer == "2") then
		e.self:Say("My army stands prepared to launch an assault on Kael itself, but one task must be completed before this can happen.");
		eq.set_timer("3",15000);
	elseif(e.timer == "3") then
		e.self:Say("It seems Rodrick was not alone in his treachery. There is a faction of Coldain who believe that a treaty should be signed with the Kromrif, ending our hostilities with them. This, of course, is impossible. If there is one thing our history here has taught us it is that the Kromrif simply cannot be trusted.");
		eq.set_timer("4",24000);
	elseif(e.timer == "4") then
		e.self:Say("These traitors are poisoning the minds of our citizens, promising great rewards to those who will betray the Dain. It will take an unbiased eye of an outlander to flush out masterminds behind this plan. Once again we turn to you.");
		eq.set_timer("5",10000);
	elseif(e.timer == "5") then
		e.self:Say("Will you [" .. eq.say_link("accept this task") .. "], outlander?");
	end
	eq.stop_timer(e.timer);
end

function event_signal(e)
	if(e.signal == 1) and not escort then --Night - will not restart grid if already escorted back to room (9th ring quest)
		e.self:SetCurrentWP(0);
		eq.start(54);
		--eq.move_to(67,654,39,255,true);
	elseif(e.signal == 2) then --Day
		escort = false;
		e.self:SetCurrentWP(0);
		eq.start(53);
		--eq.move_to(5,545,66,0,true);
	end
end
