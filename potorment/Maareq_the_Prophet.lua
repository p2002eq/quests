--Maareq_the_Prophet (207004)
--Plane of Torment (Saryrn's Tower)

function event_spawn(e)
	eq.set_next_hp_event(80);
end

function event_hp(e)
	if e.hp_event == 80 then
		e.self:Emote("raises his arms towards the sky and screams! His exposed skin bulges and writhes, as the creatures that clung to him move beneath its surface.");
		e.self:Shout("My prophecy was fulfilled for Saryrn.  Your fate shall come to fruition as well!  I have a special vision for you.  Now, step forward like the obedient cattle you are.  Let us begin this harvest of pain!");
		e.self:ChangeSize(10);
		eq.set_next_hp_event(60);
	elseif e.hp_event == 60 then
		e.self:Say("Your assault only prolongs the inevitable!  I can feel the fear dripping for you.  Give into it.  Give up while you still have enough energy to suffer properly!");
		eq.zone_emote(7,"A horrific roar reverberates throughout the zone!  Every surface shakes violently for a moment as the sound rolls past you!");
		e.self:SetRace(281);	--set Mouth of Insanity Race
		e.self:ModifyNPCStat("attack_delay","17");	--slightly increase attack speed on transformation
		eq.set_next_hp_event(40);
	elseif e.hp_event == 40 then
		e.self:Emote("radiates with rage!  The ferocity of its attacks increases dramatically as its skin begins to bubble and burst in places!");
		e.self:ChangeSize(14);
		e.self:SetSpecialAbility(SpecialAbility.area_rampage,1);	--enable AE Rampage
	end
end

function event_combat(e)
	if e.joined then
		eq.set_timer("minions", 5 * 1000);
		eq.set_timer("monitor",1);
		eq.stop_timer("reset");
	else
		eq.stop_timer("minions");
		eq.set_timer("reset", 3 * 60 * 1000)
	end
end

function event_timer(e)
	if e.timer == "minions" then
		if e.self:IsEngaged() then
			eq.spawn2(207293,25,0,-28,-2,452,64);	--a_minion_of_Maareq (207293)
		else
			eq.stop_timer(e.timer);
		end
	elseif e.timer == "monitor" then
		local mob_list = eq.get_entity_list():GetMobList();
		
		if mob_list ~= nil then
			for mob in mob_list.entries do
				if mob:GetNPCTypeID() == 207293 and mob:CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ()) <= 5 then
					mob:Emote("adheres to Maareq's flesh and is quickly absorbed!");
					mob:Depop();
					e.self:HealDamage(5000);
				end
			end
		end
	elseif e.timer == "reset" and not e.self:IsEngaged() then
		eq.stop_timer(e.timer);
		e.self:SetRace(1); --Human
		e.self:ChangeSize(7);	-- 7 default size
		e.self:ModifyNPCStat("attack_delay","20");	--default attack speed
		eq.set_next_hp_event(80);	--reset hp event
	end
end

function event_death_complete(e)
	eq.signal(207014,1);	--Tylis_Newleaf (207014)  signal to activate
	eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()},7,500,"A strange female voice drifts from the bloated corpse that lies slumped before you, 'Maareq, I cannot feel your presence.  What has happened?  My head feels strange... what is happening to me?'");
	eq.stop_all_timers();
	eq.depop_all(207293);	--depop minions
end
