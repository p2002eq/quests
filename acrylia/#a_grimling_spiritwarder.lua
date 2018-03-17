-- #a_grimling_spiritwarder (NPC ID: 154148 & 154149)
-- Khati Sha Event
-- Ward of Spirit

function event_spawn(e)
	e.self:SetSpecialAbility(24, 1);		--mobs initially set to not aggro
	eq.set_next_hp_event(99);
end

function event_combat(e)
	if e.joined then
		e.self:SetSpecialAbility(24,0);
		eq.signal(e.self:GetNPCTypeID(),1);
	end
end

function event_signal(e)
	if e.signal == 1 then
		e.self:SetSpecialAbility(24,0);
	end
end

function event_hp(e)
	if e.hp_event == 99 then
		e.self:SetSpecialAbility(24,0);
		eq.signal(e.self:GetNPCTypeID(),1);	--signals other spiritwarders of same NPC type ID to aggro/assist
	end
end