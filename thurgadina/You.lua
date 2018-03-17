
-- flavor dialogue during the seventh prayer shawl quest
-- this is the npc on live servers that responds to the player reciting prayer to brell.
-- quest needed to be changed slightly since an untargetted npc will not respond
-- to dialogue on the emu

function event_signal(e)
	if (e.signal == 33) then
		e.self:Emote("can feel a strong presence beginning to take shape in the chapel. Perhaps you should recite the prayer again.");
	elseif (e.signal == 66) then
		e.self:Emote("sense a being of great power focusing its attention on you.");
	elseif (e.signal == 99) then
		e.self:Emote("have been inspired! Brell has heard your prayers and granted your request.");
	end
end
